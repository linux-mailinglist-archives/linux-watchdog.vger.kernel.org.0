Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 5BAE31A6D9B
	for <lists+linux-watchdog@lfdr.de>; Mon, 13 Apr 2020 22:52:54 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388609AbgDMUwx (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 13 Apr 2020 16:52:53 -0400
Received: from mail.kernel.org ([198.145.29.99]:35158 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S2388526AbgDMUwx (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 13 Apr 2020 16:52:53 -0400
Received: from kernel.org (unknown [104.132.0.74])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by mail.kernel.org (Postfix) with ESMTPSA id 25E5B20656;
        Mon, 13 Apr 2020 20:52:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1586811172;
        bh=hcLUBAjHWZDbxuBDsEVoulKW3srDsvBGJUVKF0VLiFo=;
        h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
        b=y1LSEo2YTL/bQ+YKW0FKzLXHQ4arq9jT7KRn1akCHZZNZCKW0PMRIN2dDnZaf7H4C
         z7As1OA6GyPSxjx6oRnCsC4eIXAIRvbi8pHeeqZHs+ttJamz7R1KpjS7NHY2mIc+Gv
         sRigipQDqDfY4cqnp2kBd1IW7UAmdtp7rihs/oDU=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20200410185934.o4aucef2xhbradlp@ubsrv2.baikal.int>
References: <20200306132747.14701-1-Sergey.Semin@baikalelectronics.ru> <20200306132831.89B658030706@mail.baikalelectronics.ru> <20200315142207.GA8424@roeck-us.net> <20200410185934.o4aucef2xhbradlp@ubsrv2.baikal.int>
Subject: Re: [PATCH 5/7] watchdog: dw_wdt: Support devices with asynch clocks
From:   Stephen Boyd <sboyd@kernel.org>
Cc:     Michael Turquette <mturquette@baylibre.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Alexey Malahov <Alexey.Malahov@baikalelectronics.ru>,
        Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
        Paul Burton <paulburton@kernel.org>,
        Ralf Baechle <ralf@linux-mips.org>,
        linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
To:     Guenter Roeck <linux@roeck-us.net>,
        Sergey Semin <Sergey.Semin@baikalelectronics.ru>
Date:   Mon, 13 Apr 2020 13:52:51 -0700
Message-ID: <158681117129.84447.14839907555361565766@swboyd.mtv.corp.google.com>
User-Agent: alot/0.9
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Quoting Sergey Semin (2020-04-10 11:59:34)
> Michael, Stephen, could you take a look at the issue we've got here?
>=20
> Guenter, my comment is below.
>=20
> On Sun, Mar 15, 2020 at 07:22:07AM -0700, Guenter Roeck wrote:
> > On Fri, Mar 06, 2020 at 04:27:45PM +0300, Sergey.Semin@baikalelectronic=
s.ru wrote:
> > > @@ -358,10 +375,27 @@ static int dw_wdt_drv_probe(struct platform_dev=
ice *pdev)
> > >             goto out_disable_clk;
> > >     }
> > > =20
> > > +   /*
> > > +    * Request APB clocks if device is configured with async clocks m=
ode.
> > > +    * In this case both tclk and pclk clocks are supposed to be spec=
ified.
> > > +    * Alas we can't know for sure whether async mode was really acti=
vated,
> > > +    * so the pclk reference is left optional. If it it's failed to be
> > > +    * found we consider the device configured in synchronous clocks =
mode.
> > > +    */
> > > +   dw_wdt->pclk =3D devm_clk_get_optional(dev, "pclk");
> > > +   if (IS_ERR(dw_wdt->pclk)) {
> > > +           ret =3D PTR_ERR(dw_wdt->pclk);
> > > +           goto out_disable_clk;
> > > +   }
> > > +
> > > +   ret =3D clk_prepare_enable(dw_wdt->pclk);
> >=20
> > Not every implementation of clk_enable() checks for a NULL parameter.
> > Some return an error. This can not be trusted to work on all platforms /
> > architectures.
>=20
> Hm, this was unexpected twist. I've submitted not a single patch with opt=
ional
> clock API usage. It was first time I've got a comment like this, that the
> API isn't cross-platform. As I see it this isn't the patch problem, but t=
he
> platforms/common clock bug. The platforms code must have been submitted b=
efore
> the optional clock API was introduced or the API hasn't been properly
> implemented or we don't understand something.
>=20
> Stephen, Michael could you clarify the situation with the
> cross-platformness of the optional clock API.
>=20

NULL is a valid clk to return from clk_get(). And the documentation of
clk_enable() says that "If the clock can not be enabled/disabled, this
should return success". Given that a NULL pointer can't do much of
anything I think any platform that returns an error in this situation is
deviating from the documentation of the clk API.

Does any platform that uses this driver use one of these non-common clk
framework implementations? All of this may not matter if they all use
the CCF.

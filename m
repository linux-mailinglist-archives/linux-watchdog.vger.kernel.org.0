Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 50D353A4428
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Jun 2021 16:36:05 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231584AbhFKOiB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 11 Jun 2021 10:38:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55938 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231577AbhFKOiA (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 11 Jun 2021 10:38:00 -0400
Received: from mail-ot1-x336.google.com (mail-ot1-x336.google.com [IPv6:2607:f8b0:4864:20::336])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C0FF0C061574;
        Fri, 11 Jun 2021 07:35:46 -0700 (PDT)
Received: by mail-ot1-x336.google.com with SMTP id h24-20020a9d64180000b029036edcf8f9a6so3345906otl.3;
        Fri, 11 Jun 2021 07:35:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=5I09DPd8Kwy7LMo76EGR3YM2G9Xf21apnHARNeBFJ+k=;
        b=bXofxSglPVxt7p7Om3fW43zbPw9IPtI1w0qmIpQ21u3NhjCsxcOO/bt340q43zLIrX
         D8GMFZJ147WnbH+bqcbLL/EK7Y9wxXWy72BSMk//WwQouZzIJG9gdzvADAwtre6kG2FY
         ETGroG63+oDDWxfRMXl3YF8bAKBRLUBpf483KfGyO2obWNdfqW/BsHdomPfI+6zdkcgg
         UjMvzSkgYpd/px6Y+E52FBgGvNx4MKu1ni1Gm/hU5nOuQjmddK6xqbZGwMumDp2WWOIw
         WRlwzuOUR2TqcxOSGHKTyaYAlwEaiWXi3fOwrCm8lWpePsF90lK3lDh3AiQHW+mw3Xbs
         yPZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=5I09DPd8Kwy7LMo76EGR3YM2G9Xf21apnHARNeBFJ+k=;
        b=PMyasl5dxXzFN31LbrDcYUde4rXjpbYK0dFEO+nPbsadRiHgw9GFSC0s9NHCH6f6q3
         5c2sDCGvbmv9noI6jNOam4gFI+L9lWdJ4NeShTlwNbxKQMt5ecoNSN2r5gu+2f5Vj6kM
         95ONv8cT6vApA1iBUQnFZmRUd/W8qWQzas719w5YYFBa28azXVLYJGrSOpyLP+yTsc/1
         HfrlLJxRjSPwLwpbZha2zeOhkYmMNIUMO7S1ar6jDJkkMK///lAsPQ45P2O7hHEOZJWK
         Vl8XnyInhwwDwFrWhlpJOW/UtQcvnPGScLHB7Ijs//IYVWeOYMXQYUpyFXGr9758mxEa
         wxhQ==
X-Gm-Message-State: AOAM530KDztiPvKiFAUygJa//xV3KkdJU2xrpBvjcvePGmbJcr8qkgF9
        9Rn6YiuzxfSH4qXJXYI+o5ECu5QwVeaUQp4wsjw=
X-Google-Smtp-Source: ABdhPJyBX0YMR9nw4FCEWqEtfHxhwPSKQX3qlzHtQjCQ+5AoKjVXFo5BqKi2wCn7x9zZ/JfhKinZYGBwyPBAxIp/XX0=
X-Received: by 2002:a9d:5382:: with SMTP id w2mr3349667otg.290.1623422145756;
 Fri, 11 Jun 2021 07:35:45 -0700 (PDT)
MIME-Version: 1.0
References: <20210605170441.33667-1-romain.perier@gmail.com>
 <20210605170441.33667-3-romain.perier@gmail.com> <20210611103426.GA3827319@roeck-us.net>
In-Reply-To: <20210611103426.GA3827319@roeck-us.net>
From:   Romain Perier <romain.perier@gmail.com>
Date:   Fri, 11 Jun 2021 16:35:33 +0200
Message-ID: <CABgxDoJhCiBoyJW3WOF9Jac9QcAfDxE5wND6gg1tvqd74hd+NQ@mail.gmail.com>
Subject: Re: [PATCH v3 2/3] watchdog: Add Mstar MSC313e WDT driver
To:     Guenter Roeck <linux@roeck-us.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Rob Herring <robh+dt@kernel.org>,
        Daniel Palmer <daniel@0x0f.com>,
        Mohammed Billoo <mohammed.billoo@gmail.com>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Le ven. 11 juin 2021 =C3=A0 12:34, Guenter Roeck <linux@roeck-us.net> a =C3=
=A9crit :
>
> On Sat, Jun 05, 2021 at 07:04:40PM +0200, Romain Perier wrote:
> > From: Daniel Palmer <daniel@0x0f.com>
> >
> > It adds a driver for the IP block handling the watchdog timer found for
> > Mstar MSC313e SoCs and newer.
> >
> > Signed-off-by: Daniel Palmer <daniel@0x0f.com>
> > Co-developed-by: Romain Perier <romain.perier@gmail.com>
> > Signed-off-by: Romain Perier <romain.perier@gmail.com>
> > Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> > ---
> >  MAINTAINERS                    |   1 +
>
> I tried to apply this patch to my tree, but it doesn't apply because ...
>
> >  drivers/watchdog/Kconfig       |  12 +++
> >  drivers/watchdog/Makefile      |   1 +
> >  drivers/watchdog/msc313e_wdt.c | 166 +++++++++++++++++++++++++++++++++
> >  4 files changed, 180 insertions(+)
> >  create mode 100644 drivers/watchdog/msc313e_wdt.c
> >
> > diff --git a/MAINTAINERS b/MAINTAINERS
> > index a0f37adb9e64..fcc10c57298c 100644
>
> a0f37adb9e64 is not an upstream SHA and there is a conflict. Please resen=
d
> the series based on some upstream tag.
>
> Guenter

Arf, I will rebase and resend then, my bad. It is okay if I rebase the
series onto https://git.kernel.org/pub/scm/linux/kernel/git/groeck/linux-st=
aging.git
, branch watchdog-next ?

Romain

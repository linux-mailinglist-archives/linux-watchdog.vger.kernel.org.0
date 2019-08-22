Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 9D9FB99658
	for <lists+linux-watchdog@lfdr.de>; Thu, 22 Aug 2019 16:24:32 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387944AbfHVOYb (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 22 Aug 2019 10:24:31 -0400
Received: from mta-02.yadro.com ([89.207.88.252]:60606 "EHLO mta-01.yadro.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2387945AbfHVOYb (ORCPT <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 22 Aug 2019 10:24:31 -0400
Received: from localhost (unknown [127.0.0.1])
        by mta-01.yadro.com (Postfix) with ESMTP id 13D5142ED0;
        Thu, 22 Aug 2019 14:24:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=yadro.com; h=
        content-transfer-encoding:mime-version:user-agent:content-type
        :content-type:organization:references:in-reply-to:date:date:from
        :from:subject:subject:message-id:received:received:received; s=
        mta-01; t=1566483869; x=1568298270; bh=1bYRqwEu9883JdGs0AKW2xnM1
        tOirxhg2R2RAn574Yw=; b=WrFYMZ73tDcLaxuzNV0YP82ZaIl/Pp8Edk3uPxpMK
        2ELuiFrr+5kF4vHxMbil5kIVphU9p12SI+Orutc0p05tPpvMSIcSo8OVVvFg3lWf
        ZkErBrZrmQRBminqZyhRsaMlBhrLgDK7zshIKKLd3fkL+v6WWQftTyWtM8wWmBq6
        ls=
X-Virus-Scanned: amavisd-new at yadro.com
Received: from mta-01.yadro.com ([127.0.0.1])
        by localhost (mta-01.yadro.com [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id Pu7N4TeU8Is4; Thu, 22 Aug 2019 17:24:29 +0300 (MSK)
Received: from T-EXCH-02.corp.yadro.com (t-exch-02.corp.yadro.com [172.17.10.102])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-SHA384 (256/256 bits))
        (No client certificate requested)
        by mta-01.yadro.com (Postfix) with ESMTPS id 876BC412D3;
        Thu, 22 Aug 2019 17:24:28 +0300 (MSK)
Received: from localhost.localdomain (172.17.15.69) by
 T-EXCH-02.corp.yadro.com (172.17.10.102) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_CBC_SHA384_P384) id
 15.1.669.32; Thu, 22 Aug 2019 17:24:28 +0300
Message-ID: <550d98a41f8c36effb8147201d6c5fdc762994ea.camel@yadro.com>
Subject: Re: [PATCH 3/3] watchdog/aspeed: add support for dual boot
From:   Ivan Mikhaylov <i.mikhaylov@yadro.com>
To:     Guenter Roeck <linux@roeck-us.net>
CC:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Joel Stanley <joel@jms.id.au>,
        Andrew Jeffery <andrew@aj.id.au>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-aspeed@lists.ozlabs.org>, <linux-kernel@vger.kernel.org>,
        "Alexander Amelkin" <a.amelkin@yadro.com>
Date:   Thu, 22 Aug 2019 17:24:27 +0300
In-Reply-To: <20190822135528.GB8144@roeck-us.net>
References: <1f2cd155057e5ab0cdb20a9a11614bbb09bb49ad.camel@yadro.com>
         <20190821163220.GA11547@roeck-us.net>
         <a022c0590f0fbf22cc8476b5ef3f1c22746429ac.camel@yadro.com>
         <20190822135528.GB8144@roeck-us.net>
Organization: YADRO
Content-Type: text/plain; charset="UTF-8"
User-Agent: Evolution 3.30.5 (3.30.5-1.fc29) 
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
X-Originating-IP: [172.17.15.69]
X-ClientProxiedBy: T-EXCH-01.corp.yadro.com (172.17.10.101) To
 T-EXCH-02.corp.yadro.com (172.17.10.102)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, 2019-08-22 at 06:55 -0700, Guenter Roeck wrote:
> On Thu, Aug 22, 2019 at 12:15:20PM +0300, Ivan Mikhaylov wrote:
> > On Wed, 2019-08-21 at 09:32 -0700, Guenter Roeck wrote:
> > > > +	writel(WDT_CLEAR_TIMEOUT_AND_BOOT_CODE_SELECTION,
> > > > +			wdt->base + WDT_CLEAR_TIMEOUT_STATUS);
> > > > +	wdt->wdd.bootstatus |= WDIOF_EXTERN1;
> > > 
> > > The variable reflects the _boot status_. It should not change after
> > > booting.
> > 
> > Okay, then perhaps may we set 'status' handler for watchdog device and
> > check 
> > 'status' file? Right now 'bootstatus' and 'status' are same because there is
> > no
> > handler for 'status'.
> > 
> 
> You would still have to redefine one of the status bits to mean something
> driver specific. You would also still have two different flags to read
> and control cs0 - to read the status, you would read an ioctl (or the
> status sysfs attribute), to write it you would write into access_cs0.
> 
> I guess I must be missing something. What is the problem with using
> access_cs0 for both ?
> 
> Guenter
> 

There is no problem, I'll do that way, thanks!


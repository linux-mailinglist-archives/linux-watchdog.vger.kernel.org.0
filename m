Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 4D6E6166169
	for <lists+linux-watchdog@lfdr.de>; Thu, 20 Feb 2020 16:52:03 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728305AbgBTPwD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 20 Feb 2020 10:52:03 -0500
Received: from mail-pj1-f65.google.com ([209.85.216.65]:54492 "EHLO
        mail-pj1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728289AbgBTPwC (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 20 Feb 2020 10:52:02 -0500
Received: by mail-pj1-f65.google.com with SMTP id dw13so1041643pjb.4;
        Thu, 20 Feb 2020 07:52:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Ee8gYjz2/NK3zQLUacTfzriK0f627854wQ+fW/DiGas=;
        b=ibHAPK4dZOkBgSjnYOBBy1bLrcL86MaTk6ozB+/+/v8Xwo8BhyjNmuNYQm8JzD9Kg1
         5qG1SG+eGRtqdVDZaRz3YBTeI3csa558ewIUOxhTilOF82ambXFO1eF3nzmQR7ROjkqH
         DtQLxVIS4Hh/rcU2k45+k6FOjn4yqmDpidLwAps1ftNYSIYe0TMegSiW2c/aAGt/g+m2
         E0wuYiXYNhNRh2R7je4UeLXVI7YDIRSX+pm4jUs7bzppXuX++6H0E/qUGwGWX9r31Jaa
         eKLN3CuaVPywV1DXlfeAozmFoB6+G5Pwu/OHVikR1rZZqmjj3biGrCHtQYdAz4z+oPwM
         w4BA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=Ee8gYjz2/NK3zQLUacTfzriK0f627854wQ+fW/DiGas=;
        b=hk68NHlYUl0byLAPBd5xxF2exl9A/458xjWSVRsWvSP/5R2B00NqVGYEYwkQc7flC0
         ZLdpQ5hB6Y/MC7iWNzlNza2S/tbHy/3/9zyAgPzhQsm3Sd0+rQKOI8/gJl+02dCU8dJn
         TY8FvrMIwmc8pv11bpwpfzb1+tr3GOktIG/eJX0pep6ZAXqfxuRbrCyl9OpjFRoSFzIE
         +RExnVvXJXYI0DVw+sZHqsdmDs3Q7qRYaBMtEjisbT1arf3CqVKB/9sxa7+QeGqXCfRh
         JaECTjY5G6aUrWBAQZ/n0hPrJPwQkYcxYnV0vXr/DYMST3gbWW5o0kcAMkMreO78n/Ki
         TKRg==
X-Gm-Message-State: APjAAAWJtbgITJGU4MwoeU6H44zu2RU6gUVHmxgSzD2E/w+uFJX5n6wr
        XFINqrBSJYJgKRCIjPNxTF0=
X-Google-Smtp-Source: APXvYqwEM87xdIwcka2RcS2+volC1263cunDaDInFyyuPNjsIvj3zzwsaqK+yOuYzvDmBnMgIWiUxA==
X-Received: by 2002:a17:902:223:: with SMTP id 32mr32169684plc.167.1582213922023;
        Thu, 20 Feb 2020 07:52:02 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id f13sm4207582pgk.12.2020.02.20.07.52.00
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 20 Feb 2020 07:52:00 -0800 (PST)
Date:   Thu, 20 Feb 2020 07:52:00 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Evan Benn <evanbenn@chromium.org>
Cc:     LKML <linux-kernel@vger.kernel.org>,
        Julius Werner <jwerner@chromium.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Marcin Juszkiewicz <marcin.juszkiewicz@linaro.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Olof Johansson <olof@lixom.net>,
        Leonard Crestez <leonard.crestez@nxp.com>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Dinh Nguyen <dinguyen@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Will Deacon <will@kernel.org>, linux-watchdog@vger.kernel.org,
        Rob Herring <robh@kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        =?iso-8859-1?Q?Cl=E9ment_P=E9ron?= <peron.clem@gmail.com>,
        Shawn Guo <shawnguo@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Anson Huang <Anson.Huang@nxp.com>
Subject: Re: [PATCH 2/2] watchdog: Add new arm_smc_wdt watchdog driver
Message-ID: <20200220155159.GB29658@roeck-us.net>
References: <20200214062637.216209-1-evanbenn@chromium.org>
 <20200214172512.2.I7c8247c29891a538f258cb47828d58acf22c95a2@changeid>
 <804d3cc5-688d-7025-cb87-10b9616f4d9b@roeck-us.net>
 <CAKz_xw0fHgVBLdEoEoQ7OSAgBcvYBAowV0obWLsDUGNPotP55Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAKz_xw0fHgVBLdEoEoQ7OSAgBcvYBAowV0obWLsDUGNPotP55Q@mail.gmail.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Feb 20, 2020 at 05:50:03PM +1100, Evan Benn wrote:
> > > +     if ((int)res->a0 == PSCI_RET_NOT_SUPPORTED)
> > > +             return -ENOTSUPP;
> >
> > -ENODEV would be better here.
> >
> > > +     if ((int)res->a0 == PSCI_RET_INVALID_PARAMS)
> > > +             return -EINVAL;
> > > +     if ((int)res->a0 < 0)
> > > +             return -EIO;
> 
> In fixing this I found drivers/firmware/psci/psci.c:145
> Which also translates psci codes to errno codes, but uses EOPNOTSUPP:
> 
>     switch (errno) {
>     case PSCI_RET_SUCCESS:
>         return 0;
>     case PSCI_RET_NOT_SUPPORTED:
>         return -EOPNOTSUPP;
>     case PSCI_RET_INVALID_PARAMS:
>     case PSCI_RET_INVALID_ADDRESS:
>         return -EINVAL;
>     case PSCI_RET_DENIED:
>         return -EPERM;
>     };
> 
>     return -EINVAL;
> 
> Are these more appropriate?
> 

It is customary for driver probe functions to return -ENODEV if the
device is not supported. I don't see a reason why this driver should
behave any different. "but this other driver does it" is never a good
argument.

Having said that, yet, with the exception of -EOPNOTSUPP the other
return values would be more appropriate.

Guenter

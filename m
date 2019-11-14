Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id A8D41FCA8D
	for <lists+linux-watchdog@lfdr.de>; Thu, 14 Nov 2019 17:08:21 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726640AbfKNQIV (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Thu, 14 Nov 2019 11:08:21 -0500
Received: from mail-pg1-f194.google.com ([209.85.215.194]:45229 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726339AbfKNQIU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Thu, 14 Nov 2019 11:08:20 -0500
Received: by mail-pg1-f194.google.com with SMTP id k1so2742181pgg.12;
        Thu, 14 Nov 2019 08:08:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:content-transfer-encoding:in-reply-to
         :user-agent;
        bh=ayAVj6XklJJBJPKHbdoumjHnfHk65xz206ddr7YvVB0=;
        b=ooW5Ua4E4EOqBaLeWVLobQoOF6HaU61zJ2P4lJPsXX735kybv1kRnmqogrM2jVOw2i
         C1sg3K0QAMdnkowcVTNVO+LpoRz4pOFXkoxgSYF0N6jLHQLUJI+zp6hUFurlQKcGj+gv
         lZekcsWWMHmcw3qoZ767UtSXJigukhyENaOIVszLHWP9R1ef0zPTdu+DazLnijRbhYTC
         m4zeYIGISgrq+i3Z34IKCIRdb8ChjpPb/vM+68cSF2kvzJw+p7DXbxltbWE88JfcydQQ
         TQ3+0S6ovbe8BE/3Slky0QEfgAUOuPczS4BQT342YJvB6Yp9i64rNTnK5BHwfLB1zjb2
         Og+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition
         :content-transfer-encoding:in-reply-to:user-agent;
        bh=ayAVj6XklJJBJPKHbdoumjHnfHk65xz206ddr7YvVB0=;
        b=BX83U1SkbaFg4tdXPhE/LS1Zq3ACOoG7uKyNSCoS3xrSCWxwEpJJYngFizmrEtxNpB
         Bv7vSeQRLpYlkg4B3xX06Jl5oVy9A0d5aw25EOJPnQGHUJff85RPJfQcLK56eZ3qbwS0
         B0imjSLqHVZZKOVboa72EEYpzQWnIz+FU8WmS2OFPdwDMwqVc3PebEcC+HKSHEZ1FWK7
         Wo0aA9vHHuHr2pkOcGhz0JZBCt04WxbXNT5bNQNX9RHpnexUUKloFemXb8oxZTAKsLsb
         BiQWBq44XNeukHxaQBwUWa8pqL3j2CZ2GJ7ENhIprdV/uuoCGBsyy6csU735d98JEVC8
         YOfQ==
X-Gm-Message-State: APjAAAXKRij7kss/0dM+sb4yYl1zIz0+g0o6VYQkWxIgS0yoG6bpHKFj
        uVgwXxpKpc9y4x1yJr4H1JB/Qjfw
X-Google-Smtp-Source: APXvYqyCmyzBlJHqpHHUz/lJupT5sWCvCMDatQwNrXhNrIxK/LqC8IZj9I4WdrOqcffBRVooMYtCbQ==
X-Received: by 2002:a62:2ccf:: with SMTP id s198mr1915441pfs.42.1573747699509;
        Thu, 14 Nov 2019 08:08:19 -0800 (PST)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id q1sm5889789pgr.92.2019.11.14.08.08.17
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 14 Nov 2019 08:08:18 -0800 (PST)
Date:   Thu, 14 Nov 2019 08:08:16 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Eugen.Hristev@microchip.com
Cc:     robh+dt@kernel.org, wim@linux-watchdog.org,
        Nicolas.Ferre@microchip.com, alexandre.belloni@bootlin.com,
        linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/3] watchdog: sama5d4_wdt: cleanup the bit definitions
Message-ID: <20191114160816.GA25430@roeck-us.net>
References: <1573474383-21915-1-git-send-email-eugen.hristev@microchip.com>
 <e34df163-60f5-35c6-05c6-845d70143fd9@roeck-us.net>
 <70ba833e-2acc-7b5a-ca29-1ae9476eb0f5@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <70ba833e-2acc-7b5a-ca29-1ae9476eb0f5@microchip.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Thu, Nov 14, 2019 at 11:34:31AM +0000, Eugen.Hristev@microchip.com wrote:
> 
> 
> On 12.11.2019 15:47, Guenter Roeck wrote:
> 
> > 
> > On 11/11/19 4:13 AM, Eugen.Hristev@microchip.com wrote:
> >> From: Eugen Hristev <eugen.hristev@microchip.com>
> >>
> >> Cleanup the macro definitions to use BIT and align with two spaces.
> >>
> >> Signed-off-by: Eugen Hristev <eugen.hristev@microchip.com>
> >> ---
> >> Changes in v3:
> >> - new patch as requested from review on ML
> >>
> >>   drivers/watchdog/at91sam9_wdt.h | 30 +++++++++++++++---------------
> >>   1 file changed, 15 insertions(+), 15 deletions(-)
> >>
> >> diff --git a/drivers/watchdog/at91sam9_wdt.h 
> >> b/drivers/watchdog/at91sam9_wdt.h
> >> index 390941c..2ca5fc5 100644
> >> --- a/drivers/watchdog/at91sam9_wdt.h
> >> +++ b/drivers/watchdog/at91sam9_wdt.h
> >> @@ -14,23 +14,23 @@
> >>   #define AT91_WDT_H
> >>   #define AT91_WDT_CR        0x00            /* Watchdog Control 
> >> Register */
> >> -#define        AT91_WDT_WDRSTT        (1    << 0)        /* Restart */
> >> -#define        AT91_WDT_KEY        (0xa5 << 24)        /* KEY 
> >> Password */
> >> +#define  AT91_WDT_WDRSTT    BIT(0)            /* Restart */
> > 
> > Using BIT() requires including linux/bits.h.
> 
> 
> Hi Guenter,
> 
> The C files include/will include the bits.h as the drivers use this 
> definition header, or, you have something else in mind ?
> 
You are supposed to include the file where it is used. If the C file
uses it again, it will need to include it again.

Guenter

> Thanks,
> Eugen
> 
> > 
> >> +#define  AT91_WDT_KEY        (0xa5 << 24)        /* KEY Password */
> >>   #define AT91_WDT_MR        0x04            /* Watchdog Mode Register */
> >> -#define        AT91_WDT_WDV        (0xfff << 0)        /* Counter 
> >> Value */
> >> -#define            AT91_WDT_SET_WDV(x)    ((x) & AT91_WDT_WDV)
> >> -#define        AT91_WDT_WDFIEN        (1     << 12)        /* Fault 
> >> Interrupt Enable */
> >> -#define        AT91_WDT_WDRSTEN    (1     << 13)        /* Reset 
> >> Processor */
> >> -#define        AT91_WDT_WDRPROC    (1     << 14)        /* Timer 
> >> Restart */
> >> -#define        AT91_WDT_WDDIS        (1     << 15)        /* Watchdog 
> >> Disable */
> >> -#define        AT91_WDT_WDD        (0xfff << 16)        /* Delta 
> >> Value */
> >> -#define            AT91_WDT_SET_WDD(x)    (((x) << 16) & AT91_WDT_WDD)
> >> -#define        AT91_WDT_WDDBGHLT    (1     << 28)        /* Debug 
> >> Halt */
> >> -#define        AT91_WDT_WDIDLEHLT    (1     << 29)        /* Idle 
> >> Halt */
> >> +#define  AT91_WDT_WDV        (0xfff << 0)        /* Counter Value */
> >> +#define  AT91_WDT_SET_WDV(x)    ((x) & AT91_WDT_WDV)
> >> +#define  AT91_WDT_WDFIEN    BIT(12)        /* Fault Interrupt Enable */
> >> +#define  AT91_WDT_WDRSTEN    BIT(13)        /* Reset Processor */
> >> +#define  AT91_WDT_WDRPROC    BIT(14)        /* Timer Restart */
> >> +#define  AT91_WDT_WDDIS        BIT(15)        /* Watchdog Disable */
> >> +#define  AT91_WDT_WDD        (0xfff << 16)        /* Delta Value */
> >> +#define  AT91_WDT_SET_WDD(x)    (((x) << 16) & AT91_WDT_WDD)
> >> +#define  AT91_WDT_WDDBGHLT    BIT(28)        /* Debug Halt */
> >> +#define  AT91_WDT_WDIDLEHLT    BIT(29)        /* Idle Halt */
> >> -#define AT91_WDT_SR        0x08            /* Watchdog Status 
> >> Register */
> >> -#define        AT91_WDT_WDUNF        (1 << 0)        /* Watchdog 
> >> Underflow */
> >> -#define        AT91_WDT_WDERR        (1 << 1)        /* Watchdog 
> >> Error */
> >> +#define AT91_WDT_SR        0x08        /* Watchdog Status Register */
> >> +#define  AT91_WDT_WDUNF        BIT(0)        /* Watchdog Underflow */
> >> +#define  AT91_WDT_WDERR        BIT(1)        /* Watchdog Error */
> >>   #endif
> >>
> > 

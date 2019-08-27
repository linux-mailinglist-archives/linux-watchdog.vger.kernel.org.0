Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id 3CC099DA87
	for <lists+linux-watchdog@lfdr.de>; Tue, 27 Aug 2019 02:19:09 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726441AbfH0ATI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 26 Aug 2019 20:19:08 -0400
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41513 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726404AbfH0ATI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 26 Aug 2019 20:19:08 -0400
Received: by mail-pl1-f195.google.com with SMTP id m9so10831405pls.8
        for <linux-watchdog@vger.kernel.org>; Mon, 26 Aug 2019 17:19:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:subject:to:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=tvCeHMxYWsp2XgIM/lL4Zt3Bx+mBzrvgha4Z8wRbEfg=;
        b=eGaaW/oS2i/yGEpf+YGW6keRDiUUtHFw+kaM3aNzpsGKJd+UpKB932GFeUzgvlZFLv
         lSFcnFJCgykBcSX551wgtbkynqLYAlX2xW0H+zAInR6m16UbN+Q0/5h/Zyq3XGIUyuEJ
         z1MeDcUR+h9nrLbE9R1ehnSz2A4Juu+4H8LSmrqCnFN0uSiqD60s4uBug3mcMCyIQol0
         XKn3orDJ53CmQk68yF3B8fT/IEP+hLhquLrBoE7DxAIxUiXf108vr8F4ppCI/zKEg6Ve
         ajOp0m8LO44lu2Pg215Em5ebtNFOE59EgB5iecuDt0a23N4OQIWByBDPyKeRezXRxBzL
         /HKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:subject:to:references:from:message-id
         :date:user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=tvCeHMxYWsp2XgIM/lL4Zt3Bx+mBzrvgha4Z8wRbEfg=;
        b=RHkGD+YGv1V2dNbgyZ0hLHkpzyPF3N2aZD7sIUSMVquDNBoguV1vRaDZ11UpYuwBhI
         zYx2K2gYe8Kf225fuZpL34AAUg6P7HjURW6g7Jvq9G1XHsabHRpt4hxeU75cJ4OOMxnO
         zdJIKT/oSThd2ztirDTwOf86jHj41Z7hN24OocFL93/SaaAk1/Nnl2qHlUwbazsxl/bT
         kSFEu0txuEhWwHMbautZYrB89c7SrRz5ITtH6FvJyi9RaZVlZMZorQmr0yQ7G22t/XzZ
         S0m8cuymlroqaM1hyC2eE+jzxz4esUoSB8gA27LNfGZwgBbRUsYPtR9Ol96U1twpWjU0
         kZhw==
X-Gm-Message-State: APjAAAUaSg1doNa79cy2CHWQ1wBsWg28GSlKCSIuuQ8X5m5aTKQRNAwJ
        T5L3cDYYknSKZ++2E+AZ7rJ9J5D6
X-Google-Smtp-Source: APXvYqyU+P96eFG3FqCID8jhvFx+tmGKfYNGZd195RmZFGHBT3MFxHGTXX41eaVmRFQ/++qcIu9UTQ==
X-Received: by 2002:a17:902:bb95:: with SMTP id m21mr21330157pls.26.1566865147438;
        Mon, 26 Aug 2019 17:19:07 -0700 (PDT)
Received: from server.roeck-us.net (108-223-40-66.lightspeed.sntcca.sbcglobal.net. [108.223.40.66])
        by smtp.gmail.com with ESMTPSA id z16sm11927037pgi.8.2019.08.26.17.19.06
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Aug 2019 17:19:06 -0700 (PDT)
Subject: Re: watchdog ioctl inconsistencies
To:     Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        "linux-watchdog@vger.kernel.org" <linux-watchdog@vger.kernel.org>
References: <2d39e6c4-c9ef-4dce-4cce-14b77f331f81@rasmusvillemoes.dk>
From:   Guenter Roeck <linux@roeck-us.net>
Message-ID: <d9e38bb0-59a0-8659-ac44-e58d0ff25940@roeck-us.net>
Date:   Mon, 26 Aug 2019 17:19:05 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
 Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <2d39e6c4-c9ef-4dce-4cce-14b77f331f81@rasmusvillemoes.dk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 8/26/19 5:54 AM, Rasmus Villemoes wrote:
> Hi,
> 
> uapi/linux/watchdog.h has these
> 
> #define WDIOC_SETOPTIONS        _IOR(WATCHDOG_IOCTL_BASE, 4, int)
> 
> This is a write from userspace perspective, so should have been _IOW.
> 
> #define WDIOC_KEEPALIVE         _IOR(WATCHDOG_IOCTL_BASE, 5, int)
> 
> This one doesn't actually take an argument, so should just have been an
> _IO - or if anything, an _IOW. One could be misled to think that if the
> int argument has 'V' somewhere (perhaps first or last byte, depending on
> endianness) that would count as a magic close.
> 
> #define WDIOC_SETTIMEOUT        _IOWR(WATCHDOG_IOCTL_BASE, 6, int)
> #define WDIOC_SETPRETIMEOUT     _IOWR(WATCHDOG_IOCTL_BASE, 8, int)
> 
> The SETTIMEOUT handling does fall through to the GETTIMEOUT case, so
> that one is indeed a "write this, but tell me what value actually took
> effect". The SETPRETIMEOUT case ends with a break, so that one is really
> _IOW.
> 
> There's not much to do about these, I think, but perhaps one could add a
> comment to the uapi header containing the magic explains-all phrase
> "historical reasons".
> 
Those ioctls were imported into git when the git repository was created.
I don't think it is worth bothering about it now. I also don't think it
would add much if any value to add "historic reason" comments.

Guenter

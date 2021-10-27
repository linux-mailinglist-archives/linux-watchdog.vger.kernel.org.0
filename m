Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 7E85043CFEA
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 19:39:14 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243356AbhJ0Rli (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 13:41:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59854 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243376AbhJ0Rlg (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 13:41:36 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 213F1C0613B9
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 10:39:11 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id v20so2489045plo.7
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 10:39:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=TXHL8oqFfs/vcKE26Qa+SQoXwbRaGeZLo2Wx0MRJIUc=;
        b=M0fPA0JKc9O7wbMn5ZxK/Rzm9bnqAAEh9jcNqj6fK91i+0YJdl4srJ7y5mJMq0xRop
         bX4KlS47tmVuBcBqxvKcJpwSgbKJguDMF6pHBTCCLCqPVb02YjARqOfWArlj5xAEM0Ao
         8BThheR7B+G3Yd1OoD7JfHKMSDUK0PsC1hL0vKVHaklq3vr5TNTlUwbkjDw2KSFgmrxp
         0IAfDCiJLjUtndhvDShAIq76VmQYBdPfsUmi7lrxIM9mZSJ+Qdlz0Ip/g0J+2LHdrMlZ
         lLIZxB5RUUdBnwRYbHJ5VsY9TZQ+isu4IWDP3IfjImoflmzQr9Qu9INM08tb8d0rb5CU
         Npog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=TXHL8oqFfs/vcKE26Qa+SQoXwbRaGeZLo2Wx0MRJIUc=;
        b=nATD0jZYTNEb+F4XR//XXANOYUGHylKVXoaC/yVLy6zAP7IeW/s5oDlhrZ+b5G3jVD
         xy71IPGr/UOgxbR43fdVhIyrnGxt9uPaPfmPQ/eINCjxEOO1JExx7/P5yG+Mj+MxX+Na
         NuslgXkt6nB8B5VSlxt2RqZbjZdKdy5dH6eaP9brUumpUk+9/WuP7rxwFjsL2W0JO6uw
         GfxJHtTl0jMIcvHrKcjFqRDxrqQAK+eB0+3mXHkWu2b/VnOeIrr/+Uh3vwZ2vCYXgJke
         r0LYj61NUAcKDnwakQkvzh19B3t5w64JRQsqfONqLeScjfu7Y0jiDJ1CGj9mh+Sf7Cr2
         x1aQ==
X-Gm-Message-State: AOAM533SY7frpSIsROjhp7I09kZdO8tVEJhvrR9TsMWI0qKS7NxLG6Vx
        2JEZVKwz7QxsapAmpbaDwxU=
X-Google-Smtp-Source: ABdhPJxXs2y0zr4sRLRx8N5DH27ow+9ZXGsK9l28+7dfbOTQcnUA6Y4ute1u/EvfpJ/5rvzlEldclA==
X-Received: by 2002:a17:902:e750:b0:140:5a4d:207a with SMTP id p16-20020a170902e75000b001405a4d207amr17378205plf.69.1635356350691;
        Wed, 27 Oct 2021 10:39:10 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id z5sm402105pge.2.2021.10.27.10.39.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 10:39:10 -0700 (PDT)
Subject: Re: [PATCH] watchdog: bcm63xx_wdt: fix fallthrough warning
To:     Guenter Roeck <linux@roeck-us.net>,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211027123135.27458-1-zajec5@gmail.com>
 <20211027173114.GA2327649@roeck-us.net>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <7bb51f0f-6ba1-d91a-6e1c-7c7c4f5f3cbc@gmail.com>
Date:   Wed, 27 Oct 2021 10:39:08 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027173114.GA2327649@roeck-us.net>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/27/21 10:31 AM, Guenter Roeck wrote:
> On Wed, Oct 27, 2021 at 02:31:35PM +0200, Rafał Miłecki wrote:
>> From: Rafał Miłecki <rafal@milecki.pl>
>>
>> This fixes:
>> drivers/watchdog/bcm63xx_wdt.c: In function 'bcm63xx_wdt_ioctl':
>> drivers/watchdog/bcm63xx_wdt.c:208:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
>>
>> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>
> 
> [reluctantly]
> 
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> 
> ... because the driver should really be converted to use the watchdog subsystem,
> by someone with the necessary hardware to test it.

The driver should ideally be removed and we should use bcm7038_wdt.c
moving forward. Rafal, is this something you can try on 4908?

We would have to pay attention to arch/mips/bcm63xx/dev_wdt.c and
introduce a MODULE_DEVICE_TABLE() and platform_device_id so we can key
off any BCM63xx-specific behavior.
-- 
Florian

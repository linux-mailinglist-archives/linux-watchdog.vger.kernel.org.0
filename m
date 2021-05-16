Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 22E7C38221E
	for <lists+linux-watchdog@lfdr.de>; Mon, 17 May 2021 01:54:50 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234648AbhEPX4D (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Sun, 16 May 2021 19:56:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234603AbhEPX4D (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Sun, 16 May 2021 19:56:03 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C089C061573;
        Sun, 16 May 2021 16:54:48 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id n6-20020a17090ac686b029015d2f7aeea8so3556258pjt.1;
        Sun, 16 May 2021 16:54:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Av2Kpl+aeSifePXmahb/GguNFnaYsgHcxwSmmoH0UQQ=;
        b=o/FzeJpMIm8EJyZeToyNT52Q0CXbQHghHQLxnFpH4Za7mbEuOZes3FjfCTKtQqnsbx
         910WJfb65MLoFUWDe7qPAFmuY8l/sNwBCDH+QR0ImMFB+Tbu1Qgca4IyqPIpRxnIakXD
         4l3F8q717WrlJMRqDTNzggZS/mHE50+62QaQl0hENJud4s3kmwfOLaZdFq8eEpa7Y73z
         o2EkKZml0NwHp8MeX3jMCg23lPK9x3/zxgr2VP90tEwfZADBAFGTNNa6o/LoGYodtjjA
         EwwXPG9lkil+hvWK34MRyp1hWa4XVQQsV4BEhd8/EJp3YiGDLVw9bvmhlEjQS6/b7mQH
         +R8w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Av2Kpl+aeSifePXmahb/GguNFnaYsgHcxwSmmoH0UQQ=;
        b=ojZ9ufTRNUTSx/vEb/TXA2IwkjCZonMw1Id4+QHRgxVq2qlkJWulqaSu6nZWCt+MWa
         6A7F/V6TJGZj6FVE3kv8paqjIruwiC73AnmtCTVL07RvwPLIfaXo2W8IU313nJ2i3CGk
         gPAtXIJ9ClZfJw2E0QewwctXTNf5wpsORH1EAa+mxk7Yqa8gTpsDR2fEi8AG20cgfh/P
         k8qAhDnLS/E+WecGiZPEtopmYepk3yuOvoNBN3VAXfg7jgQBK7LckpmQK0Q9jS8sYe/V
         5lgwSp7LNfdSDQRHyJXlKYtDs6DaMkaDR2k6kQlIxt1bK46G74ZXVoGBH8wY820lSx8T
         WG8A==
X-Gm-Message-State: AOAM533poUVzG/HoEaT1OkVxxgHm0YyHHQMHILgShwl4nZxOmD9OIX6f
        bipWtUPV+1SZ/+BdhXq7ETGO5EdWBFznvw==
X-Google-Smtp-Source: ABdhPJwRQ0LN6LZW6/TqNPaPeYYXlQrCgqOPATOluFMsJ14TqglRX3mNosqkxRe1f4bT9V552flBOQ==
X-Received: by 2002:a17:902:7281:b029:ea:afe2:b356 with SMTP id d1-20020a1709027281b02900eaafe2b356mr58403852pll.16.1621209286099;
        Sun, 16 May 2021 16:54:46 -0700 (PDT)
Received: from [192.168.1.67] (99-44-17-11.lightspeed.irvnca.sbcglobal.net. [99.44.17.11])
        by smtp.gmail.com with ESMTPSA id o4sm13381892pjs.38.2021.05.16.16.54.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 16 May 2021 16:54:45 -0700 (PDT)
Subject: Re: [PATCH] watchdog: mtx-1: drop au1000.h header file
To:     Randy Dunlap <rdunlap@infradead.org>, linux-kernel@vger.kernel.org
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        linux-watchdog@vger.kernel.org
References: <20210516211703.25349-1-rdunlap@infradead.org>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <38c1fb0a-ccc4-73d5-9240-2db400720026@gmail.com>
Date:   Sun, 16 May 2021 16:54:43 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Firefox/78.0 Thunderbird/78.10.1
MIME-Version: 1.0
In-Reply-To: <20210516211703.25349-1-rdunlap@infradead.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org



On 5/16/2021 2:17 PM, Randy Dunlap wrote:
> The mtx-1_wdt driver does not need the au1000.h header file.
> Instead, the header file causes build errors, so drop it.
> 
> This change fixes multiple build errors, all in au1000.h. E.g.:
> 
> In file included from ../drivers/watchdog/mtx-1_wdt.c:44:
> ../arch/mips/include/asm/mach-au1x00/au1000.h: In function 'alchemy_rdsys':
> ../arch/mips/include/asm/mach-au1x00/au1000.h:603:36: error: implicit declaration of function 'KSEG1ADDR'; did you mean 'CKSEG1ADDR'? [-Werror=implicit-function-declaration]
>   603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
> ../arch/mips/include/asm/mach-au1x00/au1000.h:603:20: warning: cast to pointer from integer of different size [-Wint-to-pointer-cast]
>   603 |  void __iomem *b = (void __iomem *)KSEG1ADDR(AU1000_SYS_PHYS_ADDR);
> 
> Fixes: 04bf3b4f5fc0 ("[WATCHDOG] MTX-1 Watchdog driver")
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
> Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: linux-watchdog@vger.kernel.org
> Cc: Florian Fainelli <f.fainelli@gmail.com>

Acked-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.lfdr.de (Postfix) with ESMTP id 8C71243CFAD
	for <lists+linux-watchdog@lfdr.de>; Wed, 27 Oct 2021 19:28:56 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243262AbhJ0RbU (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 27 Oct 2021 13:31:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243261AbhJ0RbU (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 27 Oct 2021 13:31:20 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 83DCFC061745
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 10:28:54 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id om14so2575033pjb.5
        for <linux-watchdog@vger.kernel.org>; Wed, 27 Oct 2021 10:28:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=iEm9Mle5D12dB30vBWcu+Ln5yiaTtDZ5pi5U6Rhemqg=;
        b=O3Sa4V0acymRvx/g92yxRn2rhM0M2SSh9jLGU2+JA3KLpfGd0Kmi1UCsatQUA62NKx
         jtQe3YjASRG5HUJKI3wvGU5bVZWJBmV6EFsSGrkgquMZXzJhesj/RtZ/Zw1txUsoolZn
         6UJ8HhIZh92tUo0RVuX4zWlc5T6gjR+nDtD2S9DgcAC1sN05IXQBrfiJgqLcy8XrNa1O
         4AhKXaAjxXhapxtxfPWOCDy30gV7pMijfEUUI7ijGH8tQ3ZAH95kqXYpnTvjrYpsllYV
         bDXmz0fBxjykJEoF5iWZdpNhE+o690EphlU6v41z2qglxM1DnRAd5DYSSu11njXTbgJw
         9uzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=iEm9Mle5D12dB30vBWcu+Ln5yiaTtDZ5pi5U6Rhemqg=;
        b=0iiw0zNCHKZP8T4RdV0naoAOa8NIgpOSkLIlMIYxyqxgac5upjkBeaqLF2u9yI+F+p
         k0lM4CViv5d/JFGVBvTM9rWe/8MYV2t3nUy1iZ5DTZYfFYL6eujA/ELrcVs8Uey4CIbl
         vtZOik+D6iRL1Y8jqmueCgWLQtlgdcrPSNRgltz06p60Vi4XvyY4NzxABeuxsIDaJyPc
         F5gTEYbIh/Z0hqB2UylOW71hK2xB6To23JHKJIVj3YuRYuy5H2+j2kXspvUJOvpWx2FZ
         Y04brr85F4X2fkPAeW2dupIWFdoIR/Y6A+oosL7WYHPSjUXOCoGuKuDi9ILEoFDi1bII
         v01A==
X-Gm-Message-State: AOAM532azy9uMLVOH9IBZo2FzKM32WFz98mfdKAq/7NmbGOC/KSmkgS6
        krsYzvv7Wk962z2X87fPDebCDkitN/w=
X-Google-Smtp-Source: ABdhPJxOSp/LFMBV4hwaz1GDiHnK3Bf1Wb2o3JJiOYD2Mwbjt2JsWxqAkwuurlXev16NCgiP4HeUmA==
X-Received: by 2002:a17:902:e741:b0:140:9a0b:1918 with SMTP id p1-20020a170902e74100b001409a0b1918mr14145316plf.72.1635355733999;
        Wed, 27 Oct 2021 10:28:53 -0700 (PDT)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id t13sm347034pgn.94.2021.10.27.10.28.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 27 Oct 2021 10:28:53 -0700 (PDT)
Subject: Re: [PATCH] watchdog: bcm63xx_wdt: fix fallthrough warning
To:     =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <zajec5@gmail.com>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>
Cc:     Florian Fainelli <f.fainelli@gmail.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        =?UTF-8?B?UmFmYcWCIE1pxYJlY2tp?= <rafal@milecki.pl>
References: <20211027123135.27458-1-zajec5@gmail.com>
From:   Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <9434740d-968f-9aea-bbf0-721130cd9364@gmail.com>
Date:   Wed, 27 Oct 2021 10:28:51 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20211027123135.27458-1-zajec5@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 10/27/21 5:31 AM, Rafał Miłecki wrote:
> From: Rafał Miłecki <rafal@milecki.pl>
> 
> This fixes:
> drivers/watchdog/bcm63xx_wdt.c: In function 'bcm63xx_wdt_ioctl':
> drivers/watchdog/bcm63xx_wdt.c:208:17: warning: this statement may fall through [-Wimplicit-fallthrough=]
> 
> Signed-off-by: Rafał Miłecki <rafal@milecki.pl>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian

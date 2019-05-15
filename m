Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.lfdr.de (Postfix) with ESMTP id C44671F999
	for <lists+linux-watchdog@lfdr.de>; Wed, 15 May 2019 19:51:41 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727146AbfEORvl (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 15 May 2019 13:51:41 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:43264 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726562AbfEORvl (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 15 May 2019 13:51:41 -0400
Received: by mail-pf1-f194.google.com with SMTP id c6so331569pfa.10
        for <linux-watchdog@vger.kernel.org>; Wed, 15 May 2019 10:51:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=sender:date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=TRGf1+kdZ2LE2HkkmVS++x5KyY0LL5ZbUVqdxubob+8=;
        b=g3E/fMQzJWGEZlli7Am13Y+rNOe+jNxnuKnQV1C/BROegYSExEa7md5qeAN3gqRd+8
         pkJWAF4vIJEHbBhNnpp6pJ2yc9YeBegdgwrmMz1lzoywhba8gHKijnBLXlDqbW/etCCq
         B8gkc5RYCTFP21+0FUNJXfVUzYR9H93HsyZzu6L30/ldih4lzQdYuU39nKsWfI+xTnwx
         JLXAzaGgYsGozzuHnza7aSx25UaamKBtFDNqNHVFXnQa0JwZS61SpD7R/DKqdeuh9ATX
         Y3qRle/OX6INQivCIQIO1QaXBpvl2X4hScRK/i6yzBDzU3oaDyLeYybJtMBdvoTyE6/D
         Bg0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:sender:date:from:to:cc:subject:message-id
         :references:mime-version:content-disposition:in-reply-to:user-agent;
        bh=TRGf1+kdZ2LE2HkkmVS++x5KyY0LL5ZbUVqdxubob+8=;
        b=f8evmUVrkAabAsulcKMTM4oAUXSZSulOEm2XOsc6DfSSHngowRIS+rJZipmNLYpsJb
         LFYtB3MiOHFYULAwmGb4JdnBd007pt1u/zarEW3PFjmT+/W2KoICnL8tU5F3J3QbVxce
         eNZDxP/IhPbIJlmxR+PN6rzTV3q0fLQ1Sk9s0d148QW6AR8Xb7YeaU2Qt2TXODKW3+NZ
         G2LbDB7CDABF/5fCHbzqohyFit71ub+AzcCLhZ7bK1amQS7SLWoFV8twXFCIKAY0dr2X
         HYUCP/NtTcn/juRs9sUvbibxXHj/MQsKmtN41bs33SR+k0Ojee0mUXcr5HBVbQfNfVYU
         bDew==
X-Gm-Message-State: APjAAAWSDDqgOCA1iXP666K43zHjvUDnpjARcZk2hQ13K8VeZu00Hw43
        EqVY37L5Stb+EEzRomXIyBg=
X-Google-Smtp-Source: APXvYqxkB4NTD2q0KknbHrBK3jynSGINqFlBcas+vPFn1Jt7aAm53TicUSvHumAe+8X0Hf7F9fyPlA==
X-Received: by 2002:a65:56cb:: with SMTP id w11mr25371204pgs.236.1557942700508;
        Wed, 15 May 2019 10:51:40 -0700 (PDT)
Received: from localhost ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 187sm4194495pfv.174.2019.05.15.10.51.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 15 May 2019 10:51:39 -0700 (PDT)
Date:   Wed, 15 May 2019 10:51:38 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Stefan Wahren <wahrenst@gmx.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Eric Anholt <eric@anholt.net>, Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com,
        linux-arm-kernel@lists.infradead.org,
        linux-watchdog@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org
Subject: Re: [PATCH] watchdog: bcm2835_wdt: Fix module autoload
Message-ID: <20190515175138.GA16742@roeck-us.net>
References: <1557940458-8661-1-git-send-email-wahrenst@gmx.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1557940458-8661-1-git-send-email-wahrenst@gmx.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-watchdog-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Wed, May 15, 2019 at 07:14:18PM +0200, Stefan Wahren wrote:
> The commit 5e6acc3e678e ("bcm2835-pm: Move bcm2835-watchdog's DT probe
> to an MFD.") broke module autoloading on Raspberry Pi. So add a
> module alias this fix this.
> 
> Signed-off-by: Stefan Wahren <wahrenst@gmx.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
>  drivers/watchdog/bcm2835_wdt.c | 1 +
>  1 file changed, 1 insertion(+)
> 
> diff --git a/drivers/watchdog/bcm2835_wdt.c b/drivers/watchdog/bcm2835_wdt.c
> index 1834524..c7695a0 100644
> --- a/drivers/watchdog/bcm2835_wdt.c
> +++ b/drivers/watchdog/bcm2835_wdt.c
> @@ -241,6 +241,7 @@ module_param(nowayout, bool, 0);
>  MODULE_PARM_DESC(nowayout, "Watchdog cannot be stopped once started (default="
>  				__MODULE_STRING(WATCHDOG_NOWAYOUT) ")");
> 
> +MODULE_ALIAS("platform:bcm2835-wdt");
>  MODULE_AUTHOR("Lubomir Rintel <lkundrak@v3.sk>");
>  MODULE_DESCRIPTION("Driver for Broadcom BCM2835 watchdog timer");
>  MODULE_LICENSE("GPL");
> --
> 2.7.4
> 

Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EAA377ADD44
	for <lists+linux-watchdog@lfdr.de>; Mon, 25 Sep 2023 18:34:02 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232289AbjIYQeH (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 25 Sep 2023 12:34:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52718 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230049AbjIYQeG (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 25 Sep 2023 12:34:06 -0400
Received: from mail-oi1-x232.google.com (mail-oi1-x232.google.com [IPv6:2607:f8b0:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32EAFEE
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Sep 2023 09:33:58 -0700 (PDT)
Received: by mail-oi1-x232.google.com with SMTP id 5614622812f47-3a76d882052so4331671b6e.0
        for <linux-watchdog@vger.kernel.org>; Mon, 25 Sep 2023 09:33:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1695659637; x=1696264437; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:from:to:cc:subject:date:message-id
         :reply-to;
        bh=c9Rwrt0NLuVoaMis8SOjyjG9qTYGqc/AVPJ2QPq/gp0=;
        b=Z+0AdIb3vMMC7K/dLdyXpQyHc39qmDdxuojHfRU536/7rQUZ8s2e2HhBXC7s/CX6ke
         JuQAA+VGbzEDhixCQbOimRY6n5uK/yhcTYALDnTDz8g4hOfsv7OYKJNJol8r1greK0Q8
         xpqbaGCp50HBhGQoX86FfrGyrXU+DSTsE4tWJKhgaGmfvvCq3Uke3Sen1NjjXITT1+V5
         Wd1KErJC6aDWUunG8cu04iMv5AcmbvIOt3TPlHll2qydlvSCkytvYiE2UcZOYCfo5DzB
         uTtyW+OMTr155kRFGMJDA0f2awww23iuwjq5DyPVsUZ+3cwCLnXae4fwi2/NX51+HxwX
         SgrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1695659637; x=1696264437;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:sender:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=c9Rwrt0NLuVoaMis8SOjyjG9qTYGqc/AVPJ2QPq/gp0=;
        b=J82Y7rCMND6dxejx5hGJaN4jmaR16D41R2aIdBrCwyOvxItqvRIK6aE4OycwAo8tKY
         Hday4rHyFmkz8SrDXMRsz0WE3jO3npAr0GlYO6+Ckm/lIBcxGQNuXG6uPjaMZ89sZhVK
         vr57th+MZmfoghFOalUEIoJB1ojZiT0R9rvY+fbY+fUzMEbeovIWlDd+kKYtU5EC1sst
         PVdKJ6SsM9TN8YTOWEZmMNaAWj9hp5Q5Co/eDWD8q8ewEhAImT0ac7gRJYuiZyMPQQUb
         DIvjO/5TORkCWXvIx0TZ/7oBECTQ6iksDXO4G9UYtwJG2KFQjt6IBbQkBHDTJWGQMras
         KbRg==
X-Gm-Message-State: AOJu0YxfX6iZac0XtvT3eVwNMIPN1FgwNtbSPuSvCjyylHGZl+zlQOQG
        APbcXJPtjVo/VhZ40byRBsGq5Ra3vM8=
X-Google-Smtp-Source: AGHT+IH/of98FDVzlVgWc1+SRIbVh6G05hY1Bt5HCTj85IGRhZRDChC6+QLxUxjuw384w0lS036FhQ==
X-Received: by 2002:a05:6808:23d1:b0:3a7:3792:5b8a with SMTP id bq17-20020a05680823d100b003a737925b8amr10446976oib.18.1695659637320;
        Mon, 25 Sep 2023 09:33:57 -0700 (PDT)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id m13-20020aa7900d000000b006877a2e6285sm8248374pfo.128.2023.09.25.09.33.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Sep 2023 09:33:56 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 25 Sep 2023 09:33:55 -0700
From:   Guenter Roeck <linux@roeck-us.net>
To:     Werner Fischer <devlists@wefi.net>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org
Subject: Re: [PATCH] watchdog: it87_wdt: add IT8613 ID
Message-ID: <b5e1cca2-64f7-4d8e-ba3a-c2baa1e160f0@roeck-us.net>
References: <3bc0a1c2d768b23a0cd6e9f5fa0c0b5577427668.camel@wefi.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3bc0a1c2d768b23a0cd6e9f5fa0c0b5577427668.camel@wefi.net>
X-Spam-Status: No, score=-1.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=no
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Sep 25, 2023 at 03:09:46PM +0200, Werner Fischer wrote:
> This patch adds watchdog support for the ITE IT8613 watchdog.
> IT8613 watchdog works in the same way as the other watchdogs supported
> by it87_wdt.
> 
> Before this patch, IT8613 watchdog is not supported. After a modprobe,
> dmesg reports:
>   it87_wdt: Unknown Chip found, Chip 8613 Revision 000c
> With this patch, modprobe it87_wdt recognizes the watchdog as the dmesg
> output shows:
>   it87_wdt: Chip IT8613 revision 12 initialized. timeout=60 sec (nowayout=0 testmode=0)
> 
> Watchdog tests on a LES v4 have been successful, the watchdog works as
> expected with this patch [1].
> 
> [1] https://www.thomas-krenn.com/en/wiki/Watchdog#LES_v4
> 
> Signed-off-by: Werner Fischer <devlists@wefi.net>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

> ---
> 
> --- a/drivers/watchdog/it87_wdt.c	2023-09-25 15:03:52.986033681 +0200
> +++ b/drivers/watchdog/it87_wdt.c	2023-09-25 15:03:36.046415573 +0200
> @@ -13,9 +13,9 @@
>   *		    http://www.ite.com.tw/
>   *
>   *	Support of the watchdog timers, which are available on
> - *	IT8607, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665, IT8686,
> - *	IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726, IT8728,
> - *	IT8772, IT8783 and IT8784.
> + *	IT8607, IT8613, IT8620, IT8622, IT8625, IT8628, IT8655, IT8665,
> + *	IT8686, IT8702, IT8712, IT8716, IT8718, IT8720, IT8721, IT8726,
> + *	IT8728, IT8772, IT8783 and IT8784.
>   */
>  
>  #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> @@ -50,6 +50,7 @@
>  /* Chip Id numbers */
>  #define NO_DEV_ID	0xffff
>  #define IT8607_ID	0x8607
> +#define IT8613_ID	0x8613
>  #define IT8620_ID	0x8620
>  #define IT8622_ID	0x8622
>  #define IT8625_ID	0x8625
> @@ -277,6 +278,7 @@
>  		max_units = 65535;
>  		break;
>  	case IT8607_ID:
> +	case IT8613_ID:
>  	case IT8620_ID:
>  	case IT8622_ID:
>  	case IT8625_ID:
> 

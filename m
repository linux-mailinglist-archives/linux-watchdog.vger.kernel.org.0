Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 33E7C5BFFB9
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 Sep 2022 16:18:51 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229695AbiIUOSt (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 21 Sep 2022 10:18:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51976 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230255AbiIUOSs (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 21 Sep 2022 10:18:48 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6022958DF7
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Sep 2022 07:18:47 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w13so5832279plp.1
        for <linux-watchdog@vger.kernel.org>; Wed, 21 Sep 2022 07:18:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:from:to:cc:subject:date;
        bh=ZCLrdKRS09nqjMvM2KRmI6D+Xd4CmPw1Bo57M9anVHA=;
        b=hGdY+UkIYZ70AsABFglyEyQnwfUuj2uUkbZt0pf+iHMz2HXRkKZkA2nBYtM6fS854P
         90QQKcIDkdVt1KwLggD0XSMLRaXUZA1iJYG5zLeTr16ALXr8YWhnt5LDlY+5K4oE624v
         QnYbv9hom261TArxi4r2h26nsSeh+kPFN85yxNp1D2w7a3Uo/N3ee5zVBh+bqHbr/mNZ
         M54ddTvNTreU3Y9MXKKDlgqm0IXkdyOtO3UTotDf2AiBbixHiwOWhpdiPjaxqCE59qGR
         wBUMu/3eA9FH04eMAAuWU7QsHraaiUAqfXN7PpSR5L5VL88E2rJagRvzTtGW4Zb05R1v
         OTNw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :sender:x-gm-message-state:from:to:cc:subject:date;
        bh=ZCLrdKRS09nqjMvM2KRmI6D+Xd4CmPw1Bo57M9anVHA=;
        b=f+SWVZWqBgVRL9IT4ZknZSJw0uB8KGXqAz63mhYRRrPniEPWCG+OTN8hdpzV5CZhMj
         GjaDyUgaWIGBB6f9gnBUfAfyurg2T9vTSivyl6x5gwAfANzW0lNnWHv30vaDhnPEWqcg
         1flMJuCJG+vQqZp72HWOywxhlhvTuuoDUD1tgUI5t2urRIfGrYhnhbN8bETBpIJp7AGF
         Jp8H6E8qh3N9I65n+L8HDIMPlRrqRm5RB0myNtb34q0i0KuxTtA+/RJOmeaOmNgTI5yU
         qVw4mIrRjFd2j9hZhjkumXltJvLM5VImxDiEcyvPCm7To8QmkdXHL1LVyTkmGQz5QaI2
         EWMw==
X-Gm-Message-State: ACrzQf1hctoQeslV+XESiIJ7ExalZrw5ZpYbry/L8xIK71y1AnmPR7aq
        jogKmsHIf7E30eZZX7gkoVc=
X-Google-Smtp-Source: AMsMyM7ZfXHKZrpStEZF33E9MjV3AugEM88/U0A44N5hlL9ddNoIGkJbl+jh32w6BNuePRlAkrw9hQ==
X-Received: by 2002:a17:902:d2c4:b0:178:32c4:6648 with SMTP id n4-20020a170902d2c400b0017832c46648mr5084482plc.88.1663769926369;
        Wed, 21 Sep 2022 07:18:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id r17-20020aa79631000000b0053e38ac0ff4sm2158113pfg.115.2022.09.21.07.18.44
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 07:18:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <5823717b-0288-a679-824d-5a26dec5a606@roeck-us.net>
Date:   Wed, 21 Sep 2022 07:18:43 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.11.0
Subject: Re: [RFC PATCH 0/1] Suspending i.MX watchdog in WAIT mode
Content-Language: en-US
To:     Andrej Picej <andrej.picej@norik.com>,
        linux-watchdog@vger.kernel.org
Cc:     wim@linux-watchdog.org, shawnguo@kernel.org,
        s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
        linux-imx@nxp.com
References: <20220921124647.1521667-1-andrej.picej@norik.com>
From:   Guenter Roeck <linux@roeck-us.net>
In-Reply-To: <20220921124647.1521667-1-andrej.picej@norik.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Spam-Status: No, score=-5.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        NICE_REPLY_A,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 9/21/22 05:46, Andrej Picej wrote:
> Hi all,
> 
> we are using i.MX6UL with its watchdog WDOG1 and kernel 5.15.62. It was
> discovered that the watchdog triggers reset when the device is put into
> 'Suspend-To-Idle' (WAIT) state.
> 

Is that equivalent to "suspend" from Linux perspective, or some other
mode ? How does the device get into this state ?

Guenter

> i.MX6UL watchdog has a WDW (Watchdog Disable for Wait) bit in WCR
> (Watchdog Control Register) which can put the watchdog in suspend when
> the device is put to WAIT mode. Similarly, WDZST bit is already set in
> imx2_wdt driver by default, which suspends the watchdog in STOP and DOZE
> modes.
> 
> This RFC patch suspends watchdog when the device is in WAIT mode, which
> fixes our problem. During development, we noticed some reports where
> setting WDW bit caused inconsistent timeout events or inability of
> watchdog to reset the board. We didn't have these problems but I am
> curious if there is a case where device is put into WAIT mode and
> watchdog should be enabled?
> 
> Maybe for cases where watchdog is used for WAIT mode supervision? So
> basically to reset the system if device doesn't exit WAIT mode on its
> own?
> 
> The problem can be recreated with:
> 
> 	imx6ul-dev:~# echo freeze > /sys/power/state
> 	[  101.093336] PM: suspend entry (s2idle)
> 	[  101.097785] Filesystems sync: 0.000 seconds
> 	[  101.122295] Freezing user space processes ... (elapsed 0.001 seconds) done.
> 	[  101.130637] OOM killer disabled.
> 	[  101.133998] Freezing remaining freezable tasks ... (elapsed 0.001 seconds) done.
> 	[  101.142941] printk: Suspending console(s) (use no_console_suspend to debug)
> 	...
> Device resets after watchdog timeout expires! ~105s
> 
> Thank you for your feedback.
> 
> Best regards,
> Andrej
> 
> Andrej Picej (1):
>    watchdog: imx2_wdg: suspend watchdog in WAIT mode
> 
>   drivers/watchdog/imx2_wdt.c | 3 +++
>   1 file changed, 3 insertions(+)
> 


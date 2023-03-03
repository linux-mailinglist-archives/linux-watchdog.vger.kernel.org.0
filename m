Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id E32B36AA188
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:39:34 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231859AbjCCVjd (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:39:33 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51876 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231962AbjCCVj0 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:39:26 -0500
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF703C151
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:39:16 -0800 (PST)
Received: by mail-pj1-x1033.google.com with SMTP id qa18-20020a17090b4fd200b0023750b675f5so7509006pjb.3
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Mar 2023 13:39:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677879556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2puE/sz7mhf/tFMRa6sCRYx7GxKMnQsV6q7967Bt4bw=;
        b=m2oUDdzVb+4GEijJtfotdrMdQbOxdr6W3Hgvbv+NS9gENK6kz3F4fSAF+Y7Kn1VPm6
         Nu42allR6YWIRjH053N1RRNwsZxZrGXuJKBn/8t7itUXeniD6kw5Ef0Pp7SZrEEDhrsE
         3B8qGFfAczqBxv0j+E+LP8OXN4nSSR0WPjqUeLirbhFhIUtrC/AMRmEgZR1Bfe6Txh2B
         C40CDQIBIyyXRg8rBDdedkL3wEj6Gpod55jB5In8g+p6+e2L8JarFFOfidfGYq5RjsA7
         m+Lde9UySQXJO9AcjR2C93A+oqBButUZEHecIdHHxsTwYwZ3vwPYdn/5d7F7tOcnfG4Z
         2AiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677879556;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2puE/sz7mhf/tFMRa6sCRYx7GxKMnQsV6q7967Bt4bw=;
        b=JYNujrP+DjMKx/LY43sWBbMo7L82YI42LvV1TUyzAKBGAKE9RAF8y44J4FZqV/OHgs
         xL7V2h48zFnx2fscRzYwAsGNk0sTBfGx1AWCMmwy0Xk6T2w5dLXGsWPUiK9zGJupXzIU
         kvXufJaQIH3hwoK85LaxLzkZeqWevFq7tOhrCNsT6jCM95e/lgcbkvL7jxRztHlH9451
         6uJ/KMdecLb2Bb6oHIXTagegkJhatv6pjRhCbOVNQamgzSmNn2ZJvEhAux7qRSZJoqFR
         yeX4oOoeanOChvVcFjKOEYz9MoWkabJTfwa4SCz52tx0jYNNyB+AQ1D3QdG95XkDx5lC
         FvpQ==
X-Gm-Message-State: AO0yUKXTN2pntvGHTyuQYNxoM8lffxPPacu/JXFGZsZg1qYciYMV2fwD
        ZWx4/PGt03Ovgg9GU28JMWc=
X-Google-Smtp-Source: AK7set8GXQEDfQBMihad0l09CggtYLyBZRPgP7uSLgVBp1cNVtp8S3QaGHahz/iyO5KZMko7Ezvtrw==
X-Received: by 2002:a17:90b:1d8b:b0:234:1621:3792 with SMTP id pf11-20020a17090b1d8b00b0023416213792mr3177841pjb.4.1677879556256;
        Fri, 03 Mar 2023 13:39:16 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id n11-20020a17090ac68b00b00230b572e90csm1926229pjt.35.2023.03.03.13.39.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 13:39:15 -0800 (PST)
Message-ID: <47a88c39-89ff-2c3d-3d6d-327f8b0f4e83@gmail.com>
Date:   Fri, 3 Mar 2023 13:39:14 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 09/34] watchdog: bcm_kona: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-10-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230303213716.2123717-10-u.kleine-koenig@pengutronix.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.2 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FROM,NICE_REPLY_A,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS autolearn=ham
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On 3/3/23 13:36, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is (mostly) ignored
> and this typically results in resource leaks. To improve here there is a
> quest to make the remove callback return void. In the first step of this
> quest all drivers are converted to .remove_new() which already returns
> void.
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian


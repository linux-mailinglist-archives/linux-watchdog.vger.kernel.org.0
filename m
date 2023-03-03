Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id AC7E26AA181
	for <lists+linux-watchdog@lfdr.de>; Fri,  3 Mar 2023 22:39:05 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231747AbjCCVjD (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 3 Mar 2023 16:39:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51086 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231836AbjCCVjB (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 3 Mar 2023 16:39:01 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1519B2702
        for <linux-watchdog@vger.kernel.org>; Fri,  3 Mar 2023 13:38:54 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id y15-20020a17090aa40f00b00237ad8ee3a0so3605166pjp.2
        for <linux-watchdog@vger.kernel.org>; Fri, 03 Mar 2023 13:38:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1677879533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=2puE/sz7mhf/tFMRa6sCRYx7GxKMnQsV6q7967Bt4bw=;
        b=fUVpG6PsNWdrexTQddpH6er1gkrS7Qo+hesLT33AcRxHJ6C+nvFYaHBv94uC5L/GFG
         uyp6jaAJYQQJpbFblAgiG7x/bUwGK767CpT6f7LvM+JLdtGFSSSlInzGuO9/lYB9/wDY
         FNpa0qZfG5j3AO+RTKfM+E0Xt3+5BpG7ua5SDEXyDvetcAk7k/vtg3cZXuR+dTlhf8bH
         qVSr2+rdaaaf5MKDqeA5MBrXXCq1ywjD8G6PF9B3s4puU8F9qAMJaOMOxUjbsX402LdP
         Al4e88ns8u1sXEGe29g/dIU0vAUIS2EPSHPIsWc3sFvoysWQW/AqsRiHKamh4SzZZbhz
         zZJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1677879533;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=2puE/sz7mhf/tFMRa6sCRYx7GxKMnQsV6q7967Bt4bw=;
        b=jgJh+HEr+YQzwJDGi8O8s1qb7moNFLchyJ4R85dNvK0y/Qpbb1M//OGZoVztd/yOMc
         FE6qRV3cH/hQyVbthA8s6BOVhBBh/wlFHt6EUnla/nYqJLJ/9C6Xx4maRk/V0NlIkap5
         dwzYmjyoaEAZ8E3G18nawuQKvKjA4TdmO2nl9tSXx189z1+SEwznO3XMTyXuefObwb7d
         VhRFCjRxzDrVH0aQsJtMe/CdxQ1IqEVbXi7PS6J2kq08LMCQlYrVWltC608L7SeoqsY2
         tKN1H3+kRvnvat+2nKcMPETrQqpAGWAIvyWD9sMccc55HNum3pQGSxGrLzi492yIdLQ9
         XqfA==
X-Gm-Message-State: AO0yUKUOhKXH3iFbotDyprDkOgA0MwxWH2xbcexIod97iXvK4xzx1zRT
        4czJ5jSJaqfxrWDFJFIIuMo=
X-Google-Smtp-Source: AK7set/8Y13uZ6KTcnaZilw0kqRF+kJ+xVBAsTvHCEMizKDbPAM9bupB/kAxIaWVR5c5OqGKdCDVuQ==
X-Received: by 2002:a05:6a20:3c88:b0:cd:1c8e:cd44 with SMTP id b8-20020a056a203c8800b000cd1c8ecd44mr4407279pzj.47.1677879533395;
        Fri, 03 Mar 2023 13:38:53 -0800 (PST)
Received: from [10.67.48.245] ([192.19.223.252])
        by smtp.googlemail.com with ESMTPSA id r15-20020a63a54f000000b004fadb547d0csm1991844pgu.61.2023.03.03.13.38.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 03 Mar 2023 13:38:52 -0800 (PST)
Message-ID: <ad64a459-a5bb-26b2-2fd6-8166096a3369@gmail.com>
Date:   Fri, 3 Mar 2023 13:38:49 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 07/34] watchdog: bcm2835: Convert to platform remove
 callback returning void
Content-Language: en-US
To:     =?UTF-8?Q?Uwe_Kleine-K=c3=b6nig?= <u.kleine-koenig@pengutronix.de>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>
Cc:     Broadcom internal kernel review list 
        <bcm-kernel-feedback-list@broadcom.com>,
        linux-watchdog@vger.kernel.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
 <20230303213716.2123717-8-u.kleine-koenig@pengutronix.de>
From:   Florian Fainelli <f.fainelli@gmail.com>
In-Reply-To: <20230303213716.2123717-8-u.kleine-koenig@pengutronix.de>
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


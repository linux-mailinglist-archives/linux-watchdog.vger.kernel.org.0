Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 3BD977E2951
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 17:02:42 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232350AbjKFQCn (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 11:02:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47156 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232032AbjKFQCm (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 11:02:42 -0500
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B5818184
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 08:02:39 -0800 (PST)
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-1cc3c51f830so33955955ad.1
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 08:02:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286559; x=1699891359; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=PIWbDcL4dHPcVH3PWxSGFuU06h6U8wZ7rLYXXCP9qVw=;
        b=D7lvR87rmu2iQ2NRD+j0C6q7jI198844IEG6g+PrEpOHnBHKaA5JFU8jqbCFcD7jge
         NicHWHPlq+B53o5H9E/Q8WAT6CvnLvH5hkvi/tkbtXxZoe4gByiH+bcKY00UwxDvGu3E
         gfJ8Y0WEsoj5QrdpEFS2e+iif5zT2OVN0q9bUioxQ2d3C0Ex3gvJeFRnN8rq4crERQht
         Ay5/CxXZuzhuu29hMi4Yqp0iLqoVBPVOWx1d2ogyXTNBhgQaSRO+r2ecHEcsM0U+vQDo
         LLMib3L5nPXvXODqpwHMNl5gFghuOmz9w2yPI7JKKg5Z5AmgBPH/ZAAKv2t0p96at59m
         eHSg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286559; x=1699891359;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PIWbDcL4dHPcVH3PWxSGFuU06h6U8wZ7rLYXXCP9qVw=;
        b=RX6vlD7uh3K7FoWS6GQWqy3SrzdpEd+sd7F2gr8xp/svAN4L6RQSjTl/ZMXY/5xqBO
         bBCRdEBJdY/r547YvS4ikR4lus76WVGSXi89CppxktkYZzDWwnJt32ITa6VoT/veiLHl
         lDkr5HwiLzgkTNTgQpmnQJSIHCCJKD0nv95Imup1EvZIGf7mif/IfTgta1LleHcZtUDL
         dVcS70qWfB+SEKE13co0XSfJOu/X5Bi5QhObOj/vpuonmCvYDmQjO8+q0bZYCzYv4Aut
         y/i3XM1QlHI+5AQpyaN6nnCc2HPvTILLxpmT22jr8KrrfRBIX+lBTgaw4jwk3wC/KYeG
         Qtqw==
X-Gm-Message-State: AOJu0YyP3+kKaU0LJ0MYoIh0bWyPNL30lBlM3akCDyROMtvPIAgpxN/H
        imgjQzH5AyC6W7eILLTKYLE=
X-Google-Smtp-Source: AGHT+IGic4dv7ThcQBlsWozwdtfKhlz4a6NGzL7IarueoW9QsuOWa8nlKrwipjrgIYn8bHn7XyEvqw==
X-Received: by 2002:a17:902:e841:b0:1cc:51ca:52e5 with SMTP id t1-20020a170902e84100b001cc51ca52e5mr23919284plg.44.1699286559124;
        Mon, 06 Nov 2023 08:02:39 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id h13-20020a170902f7cd00b001c7453fae33sm6048920plw.280.2023.11.06.08.02.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:02:38 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 6 Nov 2023 08:02:37 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Xingyu Wu <xingyu.wu@starfivetech.com>,
        Samin Guo <samin.guo@starfivetech.com>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 4/5] watchdog: starfive-wdt: Convert to platform remove
 callback returning void
Message-ID: <ed331ea3-1204-4c29-af47-b226de6f15f5@roeck-us.net>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-5-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106154807.3866712-5-u.kleine-koenig@pengutronix.de>
X-Spam-Status: No, score=-1.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_EF,FREEMAIL_ENVFROM_END_DIGIT,
        FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,
        RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE
        autolearn=no autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

On Mon, Nov 06, 2023 at 04:48:12PM +0100, Uwe Kleine-König wrote:
> The .remove() callback for a platform driver returns an int which makes
> many driver authors wrongly assume it's possible to do error handling by
> returning an error code. However the value returned is ignored (apart
> from emitting a warning) and this typically results in resource leaks.
> 
> To improve here there is a quest to make the remove callback return
> void. In the first step of this quest all drivers are converted to
> .remove_new(), which already returns void. Eventually after all drivers
> are converted, .remove_new() will be renamed to .remove().
> 
> Trivially convert this driver from always returning zero in the remove
> callback to the void returning variant.
> 
> Signed-off-by: Uwe Kleine-König <u.kleine-koenig@pengutronix.de>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>

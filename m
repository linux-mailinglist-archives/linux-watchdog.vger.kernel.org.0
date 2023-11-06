Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 6A8527E2950
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 17:02:28 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232341AbjKFQC3 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 11:02:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48826 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232239AbjKFQC2 (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 11:02:28 -0500
Received: from mail-pf1-x436.google.com (mail-pf1-x436.google.com [IPv6:2607:f8b0:4864:20::436])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F1954107
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 08:02:25 -0800 (PST)
Received: by mail-pf1-x436.google.com with SMTP id d2e1a72fcca58-692c02adeefso3934854b3a.3
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 08:02:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286545; x=1699891345; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8P9dyXqT+AGsmrTdlb7oc4VeEvSTI1s0uSBr+ARHO6o=;
        b=J9VY+P8VzewZyCizj4gjSI5iSAsxlXYI3+e5uHoNLob7tJiaLE/eqGUYwl0EdxCs60
         3yCEsjuw9VdltQ2ZG7uM3Zjh0FC6l/HOKvzxWU5erIRYKyAWcqhtzN4MyKdNWpJZEJYj
         UZeYsNCzu8U7/eSmte8HJuxG9TtdXUkLlRHQdHpN6P0sdexE7JQvz1t8oLcPjY1A00Um
         w781sgsoDWzBD8iZbec320wOyBsQ6j4CkyS1x+Bu8xKOrSmGx/AwsW/IoAamgiZhe1/n
         IgIUfEQXTFej+xDzro0lXGY31WqIDij095TvFNWTpuEKvq7J9g8RsBmusjoyMsX7SZ+t
         kLvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286545; x=1699891345;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8P9dyXqT+AGsmrTdlb7oc4VeEvSTI1s0uSBr+ARHO6o=;
        b=hB0wMMvdmxeSV64Jv/+NpJquJFo7LZ+61pbysN6+8uNo12e9p+mBU9gxVRhRUP9zSP
         H07OFik0Kbv+bK6r500RmWBRRms+8UmSMtqYX+obZxElByK50JLbOkHzrPr/ywpQE7xI
         1Kx1zk2zZwoPLO6FlhaVqCaO8RRQVjPQGGF+vpSUKuTx81OSX6l2YNabkHYJEqlVb5Hl
         zTDjWlDZGxcA9akDqTrB3VCIWSrDb/EQ9WkWQeednQHvrFGYLIR6p+fppsoc4MCsJSPL
         2//mKqz9vYiTQ6LZ+VQosefuxywv/AyDOZ0IvefdRnEjXBmjTT8hbP0EkXncSpJsdwrM
         1COA==
X-Gm-Message-State: AOJu0YyaB6qSZ7dQnglmajrplCPQdrNIurvHWv1FsA4FJxoelXfbTdun
        R+JR0iVMPj1jfJUSknlRurY=
X-Google-Smtp-Source: AGHT+IGadnFJ97oBRwCv9jNYbZQ5fms9i5mN8DAfNSD7/uEXMbrz/Z1Q9XyubKtXNKcncVgInQIYKw==
X-Received: by 2002:a05:6a21:999f:b0:181:98d6:6afd with SMTP id ve31-20020a056a21999f00b0018198d66afdmr11451454pzb.41.1699286545279;
        Mon, 06 Nov 2023 08:02:25 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id g1-20020aa78181000000b0065a1b05193asm5767785pfi.185.2023.11.06.08.02.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:02:24 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 6 Nov 2023 08:02:24 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        Nicolas Ferre <nicolas.ferre@microchip.com>,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Claudiu Beznea <claudiu.beznea@tuxon.dev>,
        linux-watchdog@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, kernel@pengutronix.de
Subject: Re: [PATCH 3/5] watchdog: at91sam9_wdt: Convert to platform remove
 callback returning void
Message-ID: <3b11f6c0-0d5e-40f6-88a5-8f88795da529@roeck-us.net>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-4-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106154807.3866712-4-u.kleine-koenig@pengutronix.de>
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

On Mon, Nov 06, 2023 at 04:48:11PM +0100, Uwe Kleine-König wrote:
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

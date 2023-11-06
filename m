Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id BBC747E2955
	for <lists+linux-watchdog@lfdr.de>; Mon,  6 Nov 2023 17:03:07 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232192AbjKFQDI (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 6 Nov 2023 11:03:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231881AbjKFQDI (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 6 Nov 2023 11:03:08 -0500
Received: from mail-pl1-x629.google.com (mail-pl1-x629.google.com [IPv6:2607:f8b0:4864:20::629])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E4A51BF
        for <linux-watchdog@vger.kernel.org>; Mon,  6 Nov 2023 08:03:01 -0800 (PST)
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-1cc5b6d6228so29688605ad.2
        for <linux-watchdog@vger.kernel.org>; Mon, 06 Nov 2023 08:03:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1699286581; x=1699891381; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :from:to:cc:subject:date:message-id:reply-to;
        bh=t/qoJs+A1lXUTYUPFlaW/rf8AJ823vaWyENtX91KFj8=;
        b=feH4n/QfeoygsSjJ52fENkYZHgpSjYv0jRy/CqhM77Hozc4HA5LMCS/k3jFWWKpq6T
         TvSX4gBgUH6Le91FVru4IeIGpalsqsPW3ovdtn+rEelqDUWlOLs8Nztb9ljk9nvnrRH5
         PiJZjLriq4ACb2IosaEtBRzfxwg0+3CcUm+ktleEhXaSejw38ZjGowjMu/WG3j1kaarh
         AchrQLLVZM8TqUGNwiws1/U7y8d8VM9hv1kbxZP9eIZdByd+yTP+ougXMiPHGDFFRa7Z
         XCasQKTw5KDvtGU3X+gpzMPn0ozFtT0a23qvG3DxC/Sr8Qcx222gM2+F28OfGSbnRvx4
         s1Rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699286581; x=1699891381;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:sender
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=t/qoJs+A1lXUTYUPFlaW/rf8AJ823vaWyENtX91KFj8=;
        b=efi4IeoQPMWFkpDGbDf8DB/KMaXYGVY4+pCyksCSOHVbqBIW72fU28T6+8lKMjTu0s
         cFSpAsBNN82Di22F9kfxfwLFwS67xnkP8RCXylZoP9r+OPou/+Z4K5l5+oqWgDIHzxmT
         llIl8+OVY6vLXrZX3zjgFuFS3kx2wokDr+nLE/n3g3OgGrUBAcTeXxYefmdLNHzXtMHv
         rAUIegP4luwL53rhi4xj64tWw4+zF9qMvaNHWgRj4gkGWRz2Dna6MQpXvUXhtSLGr6kd
         5ebIJBsekYowbm39HOEScAfz1t8XHM8ocaqmuPNY7ZFKTf4jNJJqbl9w6J1qUyabdh/y
         nsVA==
X-Gm-Message-State: AOJu0Yw9j3ZgjpNWh1rAaQuvvlsP99EhSUt6VSvk1J+I7ySJvDfuhtXW
        AYWCyV4HJs6uIOhso/nMHD8=
X-Google-Smtp-Source: AGHT+IHpX+T0C1ELk8bYGAtWIkFKu9hKv08ULUF/UAeQ4bA5/C862T5lhPkMaMHjYPRmrG9Lh/zgIw==
X-Received: by 2002:a17:902:ce81:b0:1cc:53ed:cc78 with SMTP id f1-20020a170902ce8100b001cc53edcc78mr21641910plg.15.1699286580969;
        Mon, 06 Nov 2023 08:03:00 -0800 (PST)
Received: from server.roeck-us.net ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id 2-20020a170902ee4200b001cc1465a6f3sm6125073plo.91.2023.11.06.08.03.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Nov 2023 08:03:00 -0800 (PST)
Sender: Guenter Roeck <groeck7@gmail.com>
Date:   Mon, 6 Nov 2023 08:02:59 -0800
From:   Guenter Roeck <linux@roeck-us.net>
To:     Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= 
        <u.kleine-koenig@pengutronix.de>
Cc:     Wim Van Sebroeck <wim@linux-watchdog.org>,
        linux-watchdog@vger.kernel.org, kernel@pengutronix.de
Subject: Re: [PATCH 5/5] watchdog: txx9wdt: Convert to platform remove
 callback returning void
Message-ID: <d6c1d3f5-777c-462e-bdda-5dfa7294799e@roeck-us.net>
References: <20231106154807.3866712-1-u.kleine-koenig@pengutronix.de>
 <20231106154807.3866712-6-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20231106154807.3866712-6-u.kleine-koenig@pengutronix.de>
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

On Mon, Nov 06, 2023 at 04:48:13PM +0100, Uwe Kleine-König wrote:
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

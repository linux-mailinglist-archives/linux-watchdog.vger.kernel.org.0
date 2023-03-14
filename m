Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 98EF26B8D8F
	for <lists+linux-watchdog@lfdr.de>; Tue, 14 Mar 2023 09:39:02 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjCNIjB (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Tue, 14 Mar 2023 04:39:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230253AbjCNIit (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Tue, 14 Mar 2023 04:38:49 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 76426974B2
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Mar 2023 01:38:28 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id fy10-20020a17090b020a00b0023b4bcf0727so6914946pjb.0
        for <linux-watchdog@vger.kernel.org>; Tue, 14 Mar 2023 01:38:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1678783105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=UPJYNbXFi/Ctx3xjjqRBnzpF+Xg2J0/zDi2z4/kZT+U=;
        b=ymM7vtMg3u9UwyiW7tHFqEfu4rRGdh5Fwx0h2UlZfo8KHrJV4NpDW7wKThne67vX54
         NzPJZD8BRbBVlXDMcefVRh/nb9rohHr7qoi9VDqIxxRcgMgYlfmV405deF2VQieH4hY7
         DVS5A4HvJWxHt1sIIwJElJWJ9vyxsfCUeLWyHAg0enQGVfpYQHVQNKP7fT7DkppWM4d3
         v/Dxd5Vtxn+3IE8nbJ21jOAyVg5pzy4yDpO1Sih5yFDR3thE0MMS7LqIgbWenyOnvHqD
         3g5aFjD0idXU/2MCbtu9ehIIMJk6txSdpxq6ouaCsC/TrkmZIJV0DrOs/UfDmEmaGhIM
         M7vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1678783105;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=UPJYNbXFi/Ctx3xjjqRBnzpF+Xg2J0/zDi2z4/kZT+U=;
        b=PKJlugK0eNdcfxVHZmKZv91kxZRlxFnUF4eBjg8AQ9wDIgtVTE24L5afYVR+ECRpQO
         2DgLtx7Xvhx8Oq1/CA+fxDE9kFLh/EM9QoCXG9biD1HHdgjsN+gzVua6JNklNHmhBMo6
         ga4w57IENjK2bE1wI9tP69dhs9DrweUxMN0BCl/WJkWD9BqoDaf1wb9qLw1uiKdhkxVu
         Wj3dC7KlHM/Oe2E92F7yEb32KEdaYbBri/aHSkf16sovGDa/A5fCDFyJbbOlueGBZuvG
         Nmo73lUZyLaOcFTPs0tqYvd7E7jglYkv8N+M994FLVjtz8650W1TORTp+EkepEnu03ek
         9Frg==
X-Gm-Message-State: AO0yUKV3A5edGWY8j2XecHrYxpuu0Pb5hX/3aJ+zdvDFJ9w6pClYLxWL
        B6UqvN5yvoFE34ba/JUemzCj4g==
X-Google-Smtp-Source: AK7set+mSOw6/Z7UNLusxu0cPog1WBuZ2ETFik07TEQE4ZtEVrHe5a/SxmqywsMBcH6uKFj1OvL0hg==
X-Received: by 2002:a05:6a20:a88a:b0:d5:1f75:669a with SMTP id ca10-20020a056a20a88a00b000d51f75669amr2842812pzb.13.1678783105070;
        Tue, 14 Mar 2023 01:38:25 -0700 (PDT)
Received: from localhost.localdomain ([49.206.34.126])
        by smtp.gmail.com with ESMTPSA id p14-20020a65490e000000b004fb95c8f63esm1036839pgs.44.2023.03.14.01.38.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Mar 2023 01:38:24 -0700 (PDT)
From:   Naresh Kamboju <naresh.kamboju@linaro.org>
To:     u.kleine-koenig@pengutronix.de
Cc:     alexandre.belloni@bootlin.com, alexandre.torgue@foss.st.com,
        alim.akhtar@samsung.com, bcm-kernel-feedback-list@broadcom.com,
        claudiu.beznea@microchip.com, dianders@chromium.org,
        f.fainelli@gmail.com, kernel@pengutronix.de,
        krzysztof.kozlowski@linaro.org, leela.krishna@linaro.org,
        linux-arm-kernel@lists.infradead.org,
        linux-rpi-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        mcoquelin.stm32@gmail.com, nicolas.ferre@microchip.com,
        patches@opensource.cirrus.com, patrice.chotard@foss.st.com,
        rjui@broadcom.com, sbranden@broadcom.com, vz@mleia.com,
        wim@linux-watchdog.org,
        Linux Kernel Functional Testing <lkft@linaro.org>
Subject: [PATCH 00/34] watchdog: Convert to platform remove callback returning void
Date:   Tue, 14 Mar 2023 14:08:13 +0530
Message-Id: <20230314083813.38074-1-naresh.kamboju@linaro.org>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
References: <20230303213716.2123717-1-u.kleine-koenig@pengutronix.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org


> Hello,
> 
> this patch series adapts the platform drivers below drivers/watchdog to
> use the .remove_new() callback. Compared to the traditional .remove()
> callback .remove_new() returns no value. This is a good thing because
> the driver core doesn't (and cannot) cope for errors during remove. The
> only effect of a non-zero return value in .remove() is that the driver
> core emits a warning. The device is removed anyhow and an early return
> from .remove() usually yields a resource leak. One driver suffering from
> this problem (s3c2410) is fixed by the first patch.

This patch set applied on top of Linux next.

Build tested with gcc-12, clang-16 and clang nightly.
Boot and LTP smoketests performed on
 - qemu-x86_64
 - qemu-arm64
 - fvp-aemva
 - qemu-armv7
 - qemu-i386

Tested-by: Linux Kernel Functional Testing <lkft@linaro.org>

--
Linaro LKFT
https://lkft.linaro.org

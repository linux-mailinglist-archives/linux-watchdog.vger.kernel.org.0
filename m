Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id EB46757B716
	for <lists+linux-watchdog@lfdr.de>; Wed, 20 Jul 2022 15:13:06 +0200 (CEST)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232919AbiGTNNF (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Wed, 20 Jul 2022 09:13:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42592 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236811AbiGTNND (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Wed, 20 Jul 2022 09:13:03 -0400
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BD64C5B798
        for <linux-watchdog@vger.kernel.org>; Wed, 20 Jul 2022 06:13:00 -0700 (PDT)
Received: by mail-wm1-x32a.google.com with SMTP id id17so3746306wmb.1
        for <linux-watchdog@vger.kernel.org>; Wed, 20 Jul 2022 06:13:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9LgN/S0aDXYI9VGCuWlvvgvQnGpuTnnqHsiuzMd2wxQ=;
        b=hZDBwVWDP5UPXoM/26p/r+j251hc2vAqDOCERxSqp1n7sS06JhTWTNUFrAn/iDVTDd
         sk1s9gAeT8g6iMlidLoC2ByWsp6jDzKjyGiwTrHFM+kSqmhnpOGy27aGmIOCRSPQXtjU
         iuHcWvpuEBu/GQL3HjFfyH38HWdcfRwpw/QCs8xRs37MzT7Ik+pcHBHS4PQz7Y7kmEGs
         2zEZT/L22GV5s5xGf/GZOt2FikEOhhfo8etSuo2R+s9KR06g6oLOKoKJ9cp2Devph4aN
         HYnuH9yadQ7mkeUaGKIxYyw+FFFXzGLODhmRa8DXLmg2/yBLqQ88/ndcWxmAnabBH3H2
         gPtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9LgN/S0aDXYI9VGCuWlvvgvQnGpuTnnqHsiuzMd2wxQ=;
        b=flDvuhxRTabEDwy0hdSgT/FiV2K4qWuu2K0SHD7ek8UrRgvLY2n6g/8C3O6hg4nyRB
         S77wMlUjjFn4zayp2WHYueucSCSW9zlzghbAYjydtTe0PZzQ/ssYc8aBvsAPa2zM3dec
         ORhTfOldMKtFOORQID7Yya/jjX/6TWjPA0qOyEDoJTfWvszUW7BLFQ1rR19WZtXrtxGo
         MuFXbp5NcHQsSkduazO3uii4PwOEIH7oM2WkLCsGMF2KeHofZTlRC59LAcrPaJ17yot/
         3rmUL6Mcse2HU6BU99szseU7oyxXLsdhJMxa2pYTiBXpl/ijRWpz7nfv4yB+5OozewmN
         QbIw==
X-Gm-Message-State: AJIora+Va16sTXuv7w6p9KqbxgkrDxwupNqHZqs0SKkhe8WMnaDFdHYF
        1S9zi2DVdCYwAhrxww+/QTxgAQ==
X-Google-Smtp-Source: AGRyM1tHJE+D+NzsNowU+goDfK+LE01p5AmV4nGBMM9nPZVjT15IP9nJaaafPk1bF4qVs2pE8TNv1A==
X-Received: by 2002:a05:600c:3b91:b0:3a3:1cbe:d531 with SMTP id n17-20020a05600c3b9100b003a31cbed531mr3812400wms.159.1658322779330;
        Wed, 20 Jul 2022 06:12:59 -0700 (PDT)
Received: from amjad-ThinkPad-T490.home (2a01cb040613180084408ac44a1fa242.ipv6.abo.wanadoo.fr. [2a01:cb04:613:1800:8440:8ac4:4a1f:a242])
        by smtp.googlemail.com with ESMTPSA id y11-20020adfc7cb000000b0021d6924b777sm16853316wrg.115.2022.07.20.06.12.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 20 Jul 2022 06:12:58 -0700 (PDT)
From:   Amjad Ouled-Ameur <aouledameur@baylibre.com>
To:     fparent@baylibre.com
Cc:     broonie@kernel.org, chaotian.jing@mediatek.com,
        chunfeng.yun@mediatek.com, devicetree@vger.kernel.org,
        dmaengine@vger.kernel.org, jic23@kernel.org,
        krzysztof.kozlowski+dt@linaro.org,
        linux-arm-kernel@lists.infradead.org, linux-i2c@vger.kernel.org,
        linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mediatek@lists.infradead.org, linux-mmc@vger.kernel.org,
        linux-phy@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-spi@vger.kernel.org, linux-usb@vger.kernel.org,
        linux-watchdog@vger.kernel.org, linux@roeck-us.net,
        matthias.bgg@gmail.com, qii.wang@mediatek.com, robh+dt@kernel.org,
        srinivas.kandagatla@linaro.org, ulf.hansson@linaro.org,
        vkoul@kernel.org, wim@linux-watchdog.org
Subject: Re: [PATCH 16/17] arm64: dts: mediatek: add mt8365 device-tree
Date:   Wed, 20 Jul 2022 15:12:57 +0200
Message-Id: <20220720131257.530168-1-aouledameur@baylibre.com>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220531135026.238475-17-fparent@baylibre.com>
References: <20220531135026.238475-17-fparent@baylibre.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,RCVD_IN_DNSWL_NONE,SPF_HELO_NONE,SPF_PASS
        autolearn=unavailable autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

Hi Fabien,

> +		tzts4: tzts4-thermal {
> +			polling-delay-passive = <0>;
> +			polling-delay = <0>;
> +			thermal-sensors = <&thermal 4>;
> +			trips {};
> +			cooling-maps {};
> +		};

AFAIK mt8365 has only 3 thermal sensors, therefore tzts4 should not be
added.

Regards,
Amjad

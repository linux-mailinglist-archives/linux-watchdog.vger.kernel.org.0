Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 78BD97F1EB8
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Nov 2023 22:21:22 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230213AbjKTVVX (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Mon, 20 Nov 2023 16:21:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59244 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232289AbjKTVVP (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Mon, 20 Nov 2023 16:21:15 -0500
Received: from mail-wm1-x32d.google.com (mail-wm1-x32d.google.com [IPv6:2a00:1450:4864:20::32d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 95105E3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:11 -0800 (PST)
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-40a48775c58so21340875e9.3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Nov 2023 13:21:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1700515270; x=1701120070; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=FWrC3Ayxx8cA3cHGksIcRtfk+Sj+TKwgMP3l+aAP0Uw=;
        b=DWC0kgtEj1B0sU2zmF37ICAi8PFRdyLJN3Zy2Z62y6rFr5swCLj0USe4tAXdnaBpCV
         u6DcddHyqa02SUNjjyVxHgRE95OwugNFZem1eNX4vfNzmYzgF0/bGB6S2rN7uoKkrvoM
         zPBZJ028DwAZPHhO9lpFedJE4hw/KCG2I23GTvl/mVEw9Lb6fLJb6EqTT77WoccC+SEa
         df5irjBm5kfY4ROUikT7j3dwt8dUeczfzFppkOGrZ3yIUViSzHy4al/YAhP/jgv2nbuF
         G3yBYG/kFRUva+5qpY5jpF5EyZEMZpqgI5LLfIBWiE7ta/Xm2kq/SujqmFOePoorm2/S
         X8HA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1700515270; x=1701120070;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=FWrC3Ayxx8cA3cHGksIcRtfk+Sj+TKwgMP3l+aAP0Uw=;
        b=XReRRMiPtNqkdvS3YnTbwNIu1nL2GBeMbl8PHl9RakoMB45tDjwS/ZydSUD1LWrRy3
         w66FrWMllyvRQfVNCOVJIjsT5w7TzIDCl1ZrPtOKzYs765lAv5Mip0aZTAr6nYbTX3P3
         de6hb9IMU7KVWFEjcr3KgDVqTclwprEJb4uTZGW26BRvbk0vFQ1CmHtgUs/QtDq+qRhU
         035NgY769sFhlI0rkgyaDWiP348qdMw0upYB7stMzOPGCVFsNKqqq5dZ34IVbTkq8hJU
         k0ZgVu/D7s5gdeyIXQFtPk2jhRatwIn2wnui+E1+Afa18cj/zWT9bzNiTuX3iCDqPaxl
         bPvw==
X-Gm-Message-State: AOJu0YxWMys0RmEYrKEh2dxGUy/dpswsbILL0voBknltwKvUbgo67u2j
        oQwQCMloIo4Qqba9+WRFim8wIQ==
X-Google-Smtp-Source: AGHT+IHvnqFqvnhoaj/lvHGCgZoD7uJel+Q84X3YFSUkXyOEOaLu5vJ/ZWuBo/wwxVo2wIMuvSsRCg==
X-Received: by 2002:a05:600c:4797:b0:3fe:1232:93fa with SMTP id k23-20020a05600c479700b003fe123293famr6449271wmo.22.1700515269893;
        Mon, 20 Nov 2023 13:21:09 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id je14-20020a05600c1f8e00b0040596352951sm19518451wmb.5.2023.11.20.13.21.08
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Nov 2023 13:21:09 -0800 (PST)
From:   Peter Griffin <peter.griffin@linaro.org>
To:     robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        mturquette@baylibre.com, conor+dt@kernel.org, sboyd@kernel.org,
        tomasz.figa@gmail.com, s.nawrocki@samsung.com,
        linus.walleij@linaro.org, wim@linux-watchdog.org,
        linux@roeck-us.net, catalin.marinas@arm.com, will@kernel.org,
        arnd@arndb.de, olof@lixom.net, gregkh@linuxfoundation.org,
        jirislaby@kernel.org, cw00.choi@samsung.com,
        alim.akhtar@samsung.com
Cc:     peter.griffin@linaro.org, tudor.ambarus@linaro.org,
        andre.draszik@linaro.org, semen.protsenko@linaro.org,
        saravanak@google.com, willmcvicker@google.com, soc@kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-gpio@vger.kernel.org, linux-watchdog@vger.kernel.org,
        kernel-team@android.com, linux-serial@vger.kernel.org
Subject: [PATCH v4 03/19] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date:   Mon, 20 Nov 2023 21:20:21 +0000
Message-ID: <20231120212037.911774-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc1.413.gea7ed67945-goog
In-Reply-To: <20231120212037.911774-1-peter.griffin@linaro.org>
References: <20231120212037.911774-1-peter.griffin@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS,T_SCC_BODY_TEXT_LINE autolearn=unavailable
        autolearn_force=no version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

GS101 has three different SYSREG controllers, add dedicated
compatibles for them to the documentation.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
 .../bindings/soc/samsung/samsung,exynos-sysreg.yaml         | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
index 2de4301a467d..127f4ffde76a 100644
--- a/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
+++ b/Documentation/devicetree/bindings/soc/samsung/samsung,exynos-sysreg.yaml
@@ -22,6 +22,12 @@ properties:
               - tesla,fsd-fsys1-sysreg
               - tesla,fsd-peric-sysreg
           - const: syscon
+      - items:
+          - enum:
+              - google,gs101-apm-sysreg
+              - google,gs101-peric0-sysreg
+              - google,gs101-peric1-sysreg
+          - const: syscon
       - items:
           - enum:
               - samsung,exynos5433-cam0-sysreg
-- 
2.43.0.rc1.413.gea7ed67945-goog


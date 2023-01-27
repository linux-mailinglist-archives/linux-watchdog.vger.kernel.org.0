Return-Path: <linux-watchdog-owner@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from out1.vger.email (out1.vger.email [IPv6:2620:137:e000::1:20])
	by mail.lfdr.de (Postfix) with ESMTP id 0EDD667E04D
	for <lists+linux-watchdog@lfdr.de>; Fri, 27 Jan 2023 10:32:59 +0100 (CET)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233187AbjA0Jc4 (ORCPT <rfc822;lists+linux-watchdog@lfdr.de>);
        Fri, 27 Jan 2023 04:32:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46818 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233101AbjA0Jcj (ORCPT
        <rfc822;linux-watchdog@vger.kernel.org>);
        Fri, 27 Jan 2023 04:32:39 -0500
Received: from mail-wm1-x32b.google.com (mail-wm1-x32b.google.com [IPv6:2a00:1450:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 603E237F2F
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Jan 2023 01:32:30 -0800 (PST)
Received: by mail-wm1-x32b.google.com with SMTP id j17so3024966wms.0
        for <linux-watchdog@vger.kernel.org>; Fri, 27 Jan 2023 01:32:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bk9rrRbVlBSUREXw1iLQlsEZh4LHFBUluT2+RY/DXog=;
        b=T4ho7Z56EkelNKuLOIS7cADyCVSEQ8LKxCT/HEcCYIM9LjiuPwF5dDpt/48Ki3aOYF
         /X1dONb0m0tFA8HRxbGg/ELLlsV82x274Dsht5yhsCoc0Z1z+XageqYoXhIjIg9dOyZ2
         wmCG2WmL1hQ3eaP7KZima2CGPK1YWOI9aOYcnlqhRaWqcmxI/+BQu4FzDLISdHXsfkkt
         OXuuDN+AK9ozvh9AerLh0LNm14jNUVLcxGDpUiCq+QzWmirbFguu/Fql/MOaCopNqCVk
         Lw1ey9dHYDYMiYGsF7Q2qJlMsrMYV3G23lmLT98Jpf2H+SRM7mYpr1WNPIIiaHar9QuI
         XIEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bk9rrRbVlBSUREXw1iLQlsEZh4LHFBUluT2+RY/DXog=;
        b=tAlvOCQMeVcwITnTAyYyTR/TNrE09g8Gh1rxURaYSMFeTOgR26HBKSX+VNQunpkRv1
         imT0pEgej/GNKwx2CwefyYKMlrjCVClx1Lz0ji9f2+LzgY6OpslPWtaOkTpqF7oLrw2Q
         gqizwMEQBakXqtVwYdgYPnK40Kok1r1Pe3k+qFftxvoqpxXpB3R5SmoJ/uE+OvIe3SFQ
         G1z/kbw6yXpaGTM846GjCOBJ/i2ulbssy7SytZSQpY0aNg/QUiuvKlrR7mhu0+9Emd8q
         I1gYZwejDMZqV3QugM+TXKh1+tt7aGn44KK1gv8W4KIgSDfhjERUxO3GZoexyab9XyOK
         HhyA==
X-Gm-Message-State: AFqh2kp4MrTCIS3e4AmKx7c0sCbAeOY6gA6b6+7szMSqS+lOBbWANf1R
        oOk8vd5gWHwudA98KqQ6z2OZJg==
X-Google-Smtp-Source: AMrXdXuAo2Nkeby8FQaCuLvu5bATGCZjCqz2ulVwr97qbd2CrEuId5snzSLLdj6GWfPdbIO6KKjm1A==
X-Received: by 2002:a05:600c:54d0:b0:3d9:7847:96e2 with SMTP id iw16-20020a05600c54d000b003d9784796e2mr38265609wmb.2.1674811949873;
        Fri, 27 Jan 2023 01:32:29 -0800 (PST)
Received: from krzk-bin.. ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id e19-20020a05600c439300b003cfd4e6400csm3795265wmn.19.2023.01.27.01.32.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 27 Jan 2023 01:32:29 -0800 (PST)
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Linus Walleij <linusw@kernel.org>,
        Imre Kaloz <kaloz@openwrt.org>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Miquel Raynal <miquel.raynal@bootlin.com>,
        Richard Weinberger <richard@nod.at>,
        Vignesh Raghavendra <vigneshr@ti.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Marek Vasut <marex@denx.de>, Lubomir Rintel <lkundrak@v3.sk>,
        - <devicetree@vger.kernel.org>, Marc Zyngier <maz@kernel.org>,
        linux-ide@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        linux-mtd@lists.infradead.org, linux-serial@vger.kernel.org,
        linux-watchdog@vger.kernel.org
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v2 3/3] dt-bindings: serial: restrict possible child node names
Date:   Fri, 27 Jan 2023 10:32:17 +0100
Message-Id: <20230127093217.60818-4-krzysztof.kozlowski@linaro.org>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
References: <20230127093217.60818-1-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Spam-Status: No, score=-2.1 required=5.0 tests=BAYES_00,DKIM_SIGNED,
        DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,RCVD_IN_DNSWL_NONE,
        SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no
        version=3.4.6
X-Spam-Checker-Version: SpamAssassin 3.4.6 (2021-04-09) on
        lindbergh.monkeyblade.net
Precedence: bulk
List-ID: <linux-watchdog.vger.kernel.org>
X-Mailing-List: linux-watchdog@vger.kernel.org

The re-usable serial.yaml schema matches every property with ".*"
pattern, thus any other schema referencing it will not report unknown
(unevaluated) properties.  This hides several wrong properties.  It is
a limitation of dtschema, thus provide a simple workaround: expect
children to be only of few names matching upstream usage (Bluetooth,
GNSS, GPS and MCU).

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/serial/serial.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/serial/serial.yaml b/Documentation/devicetree/bindings/serial/serial.yaml
index e05ad3ac2abc..c9231e501f1f 100644
--- a/Documentation/devicetree/bindings/serial/serial.yaml
+++ b/Documentation/devicetree/bindings/serial/serial.yaml
@@ -96,7 +96,7 @@ then:
     rts-gpios: false
 
 patternProperties:
-  ".*":
+  "^bluetooth|gnss|gps|mcu$":
     if:
       type: object
     then:
-- 
2.34.1


Return-Path: <linux-watchdog+bounces-57-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A50D6800F1D
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 17:11:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 63E26281BBC
	for <lists+linux-watchdog@lfdr.de>; Fri,  1 Dec 2023 16:11:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id C65E14C608;
	Fri,  1 Dec 2023 16:11:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="K5SPFL9A"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 873651724
	for <linux-watchdog@vger.kernel.org>; Fri,  1 Dec 2023 08:10:54 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id 5b1f17b1804b1-40b40423df8so20062455e9.0
        for <linux-watchdog@vger.kernel.org>; Fri, 01 Dec 2023 08:10:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1701447053; x=1702051853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=t0fS/45n5pWMNmZnKLrwCqfH7Ybi7kQbfySMZpLJ3Fo=;
        b=K5SPFL9Aqd2wGciBvRT11glBhU6F50SNyUzeu7q+ZeF9/hxU/G/JCnZlVJEUEDuaEv
         rNYlHpkJjoiTr+X1yQIWCo5mTRpaQGvc39zBJYgmz6uMjOaCXX6Squ7UJmhBXdhNgrAX
         7AmEv6AI//AbRRxA4hVMWBopRhAzyMn2YusLCeqQQIfiV+3LLChRWoUTfEM9ygoqnIxn
         A/0k8wc4TODKMaOFWUsexVZKdypKrr9y6k1DD/hEoFteVGM4Ek+eK2aISNfY6I3v19ZQ
         s/BMD8YlgXfajroICm4XQWsfSxsK9wVjjcu4dCjKFZSIa8Pc3ZkEHv9nI7/YYkMnMQsT
         iqfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701447053; x=1702051853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=t0fS/45n5pWMNmZnKLrwCqfH7Ybi7kQbfySMZpLJ3Fo=;
        b=C+SuLwgt6p+W5QM/qZ13qKrP4FB2PEBhs6/TpLQ6U/IqItrkiqwhidV8Tf+JWX3fYE
         3PgIupAVOJ7MYIh00LgTM48SWQi/YxOVle5uQN7uq+SLOQpcs/YfaNNOAUWnIHxUWMgG
         8biAifKgJUz39bzyzWB5Y3xiqinxQctXoF2bizYXAsHnV8rnHU59ddY4UH8YEUBnndwf
         ZKoozBWtpUJ5DE1PuSaai18uoog7sTQSHB6kUIpp/B9EtvKQpZxFNC9Bmz4qL8MZXwuX
         jnNhcxPtTF4Ns25vWyuSB0rawjXTuqF1h0VgOlb5PN9/CE8MLFODBYF21RxQohY3S5ny
         vBsw==
X-Gm-Message-State: AOJu0YzcbEgF3tzEOs48/pqOU+v+sMvdWvlW5sQtXFACGtE+w2AXnd7E
	+e34w274TQ4R8fx2Ij3rZihtAg==
X-Google-Smtp-Source: AGHT+IFczkz+6/3BJv/r5dYlZtPDW6xQIZVaMMCqJyhd9I3BOMrjdPH3n1XHeXMkm6F11GNNyE2Hfg==
X-Received: by 2002:adf:ec11:0:b0:333:2fd2:2edd with SMTP id x17-20020adfec11000000b003332fd22eddmr1064938wrn.86.1701447053063;
        Fri, 01 Dec 2023 08:10:53 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-24-243.as13285.net. [92.29.24.243])
        by smtp.gmail.com with ESMTPSA id cg16-20020a5d5cd0000000b003332656cd73sm3907386wrb.105.2023.12.01.08.10.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 01 Dec 2023 08:10:52 -0800 (PST)
From: Peter Griffin <peter.griffin@linaro.org>
To: robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org,
	mturquette@baylibre.com,
	conor+dt@kernel.org,
	sboyd@kernel.org,
	tomasz.figa@gmail.com,
	s.nawrocki@samsung.com,
	linus.walleij@linaro.org,
	wim@linux-watchdog.org,
	linux@roeck-us.net,
	catalin.marinas@arm.com,
	will@kernel.org,
	arnd@arndb.de,
	olof@lixom.net,
	gregkh@linuxfoundation.org,
	jirislaby@kernel.org,
	cw00.choi@samsung.com,
	alim.akhtar@samsung.com
Cc: peter.griffin@linaro.org,
	tudor.ambarus@linaro.org,
	andre.draszik@linaro.org,
	semen.protsenko@linaro.org,
	saravanak@google.com,
	willmcvicker@google.com,
	soc@kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-samsung-soc@vger.kernel.org,
	linux-clk@vger.kernel.org,
	linux-gpio@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	kernel-team@android.com,
	linux-serial@vger.kernel.org
Subject: [PATCH v5 03/20] dt-bindings: soc: google: exynos-sysreg: add dedicated SYSREG compatibles to GS101
Date: Fri,  1 Dec 2023 16:09:08 +0000
Message-ID: <20231201160925.3136868-4-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.rc2.451.g8631bc7472-goog
In-Reply-To: <20231201160925.3136868-1-peter.griffin@linaro.org>
References: <20231201160925.3136868-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

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
2.43.0.rc2.451.g8631bc7472-goog



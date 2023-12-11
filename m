Return-Path: <linux-watchdog+bounces-239-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [IPv6:2604:1380:4601:e00::3])
	by mail.lfdr.de (Postfix) with ESMTPS id F1DE180D13F
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 17:24:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 9C4A71F21540
	for <lists+linux-watchdog@lfdr.de>; Mon, 11 Dec 2023 16:24:44 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 350AD4CE1D;
	Mon, 11 Dec 2023 16:24:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="IkFPu3m+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wr1-x435.google.com (mail-wr1-x435.google.com [IPv6:2a00:1450:4864:20::435])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B58CEF4
	for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:17 -0800 (PST)
Received: by mail-wr1-x435.google.com with SMTP id ffacd0b85a97d-336166b8143so2132395f8f.3
        for <linux-watchdog@vger.kernel.org>; Mon, 11 Dec 2023 08:24:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1702311856; x=1702916656; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ntQd6Owtil6YY6kfGzZXkI4IcBcs/QvakRIvV3Jrlmc=;
        b=IkFPu3m+6IESH7GEy/s2c+dGeLlES3O4Hx8YUKJQMV6wicHdIwcV8zpQnazfrHu5J5
         09ZxtBXV2j9XSNg5xgab1r29iSzf2C5b3GIdwDExabZ4f/n6XxfTWYAqcRVXKojQw5x+
         L+3lqxuiTqvSUFAvLqXPyMeIK64ke2wdBtzNbXz6vyETIe07/Komx623yPsnNldFrSsn
         EPPA9ux+LdTcBR+xepkBSrXShLcP9YuBnWHyQOyUj7vo1KYAj1qywkMsatEsWiEWUxVl
         wCYt/HL4OjvTXYTUg9qFZk1F6+TKGT1/qEmxk+WJlCQJ3Vuo7GF8HyWo+5Wy8ZECKYnd
         xezg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702311856; x=1702916656;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ntQd6Owtil6YY6kfGzZXkI4IcBcs/QvakRIvV3Jrlmc=;
        b=SBk07qVwOfl9GzWEdqeTy0cCIGCpL3ukH3X147p0+5Z5Sg0rPnMZZh1zSN8gX5WYJa
         PFjnFx7YGi34MW3TI94dldQqQ1RsBPVIpct06ROfyOkUTiNCVOx4esZ3c5IwTlrs8jo5
         w9okn+dvwJ5jtILx3ctG/Izagkh8nqOjXWqxE9Zh1FYqQLYLmR/A/oqSvG09EEUgrMFY
         BQsxsFXpKkxpjOZm2hpp1pJ2VBsXSB+DucZOGpHi0/9oPB7mnMqrjde9tRXlabAyDuXh
         SMgyHu+9u8BwcVPm+fOwhXy3tVF9P4isxN0iazmWlv+aa44f5QvuZjdTAb1cx+wtPktC
         JSPw==
X-Gm-Message-State: AOJu0Yx350dTvun5UTaH2zrP3DlotvJavOSfyqeTdhrbHgqZDS5wSiSS
	apIlVDCJMADvdSNGp3h4hUxr+Q==
X-Google-Smtp-Source: AGHT+IERzhWDtnFYAN7fglUabpiLxWRf4WJ2G4/bvTQZRB7ZPQCtA2qqWU1Rohw/fIlMIYr7Qj/kEw==
X-Received: by 2002:a5d:4412:0:b0:336:1701:f8f8 with SMTP id z18-20020a5d4412000000b003361701f8f8mr2352487wrq.52.1702311856155;
        Mon, 11 Dec 2023 08:24:16 -0800 (PST)
Received: from gpeter-l.lan (host-92-29-28-58.as13285.net. [92.29.28.58])
        by smtp.gmail.com with ESMTPSA id o4-20020a5d58c4000000b0033333bee379sm8923103wrf.107.2023.12.11.08.24.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Dec 2023 08:24:15 -0800 (PST)
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
Subject: [PATCH v7 02/16] dt-bindings: arm: google: Add bindings for Google ARM platforms
Date: Mon, 11 Dec 2023 16:23:17 +0000
Message-ID: <20231211162331.435900-3-peter.griffin@linaro.org>
X-Mailer: git-send-email 2.43.0.472.g3155946c3a-goog
In-Reply-To: <20231211162331.435900-1-peter.griffin@linaro.org>
References: <20231211162331.435900-1-peter.griffin@linaro.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This introduces bindings and dt-schema for the Google Tensor SoCs.
Currently just gs101 and pixel 6 are supported.

Reviewed-by: Sam Protsenko <semen.protsenko@linaro.org>
Signed-off-by: Peter Griffin <peter.griffin@linaro.org>
---
@RobH I removed your 'Reviewed-by: Rob Herring <robh@kernel.org>' tag
as since you reviewed this I added the empty ect node. Can you please
do the review again?

x# Please enter the commit message for your changes. Lines starting
---
 .../devicetree/bindings/arm/google.yaml       | 53 +++++++++++++++++++
 1 file changed, 53 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/arm/google.yaml

diff --git a/Documentation/devicetree/bindings/arm/google.yaml b/Documentation/devicetree/bindings/arm/google.yaml
new file mode 100644
index 000000000000..e20b5c9b16bc
--- /dev/null
+++ b/Documentation/devicetree/bindings/arm/google.yaml
@@ -0,0 +1,53 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/arm/google.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Google Tensor platforms
+
+maintainers:
+  - Peter Griffin <peter.griffin@linaro.org>
+
+description: |
+  ARM platforms using SoCs designed by Google branded "Tensor" used in Pixel
+  devices.
+
+  Currently upstream this is devices using "gs101" SoC which is found in Pixel
+  6, Pixel 6 Pro and Pixel 6a.
+
+  Google have a few different names for the SoC:
+  - Marketing name ("Tensor")
+  - Codename ("Whitechapel")
+  - SoC ID ("gs101")
+  - Die ID ("S5P9845")
+
+  Likewise there are a couple of names for the actual device
+  - Marketing name ("Pixel 6")
+  - Codename ("Oriole")
+
+  Devicetrees should use the lowercased SoC ID and lowercased board codename,
+  e.g. gs101 and gs101-oriole.
+
+properties:
+  $nodename:
+    const: '/'
+  compatible:
+    oneOf:
+      - description: Google Pixel 6 / Oriole
+        items:
+          - enum:
+              - google,gs101-oriole
+          - const: google,gs101
+
+  # Bootloader requires empty ect node to be present
+  ect:
+    type: object
+    additionalProperties: false
+
+required:
+  - ect
+
+additionalProperties: true
+
+...
-- 
2.43.0.472.g3155946c3a-goog



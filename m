Return-Path: <linux-watchdog+bounces-3559-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 1055FABF514
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 15:02:11 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id CF2D73AEAF9
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 13:00:39 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D54A2701C1;
	Wed, 21 May 2025 13:00:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ypmq5fJX"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66EE5208A7;
	Wed, 21 May 2025 13:00:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832451; cv=none; b=UnyLPupp0vlP9iAwySsjSy/TEV91HOazT99lAdaoOLn73hj82KTuDps8LJDyAIHnlVP8FOcEcHHaEqOl2mV9fmyo2P4gilQRLmWxT/04uRYG0nJAFBaNm4qtEJGrx1mBGFmwH5FQKGn0aiQzhN7L9IkD9dTy1Gi2lkaCi0NWM+c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832451; c=relaxed/simple;
	bh=qFsMhUVZOqzuNFYPlJDTF3BR26c7gUmeV5+bIDXnEJ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fYMF44LsxElFxukKYd3cdeMt++tTXnsk1DKx9ePAqlNj08VBuGK1UkxF2gZRLzmm42CwaIBsR8sx0RgnrNRqBf3xEi++rUICSfrXsgLO2HhTpUMi8kz5MVERITFIw4RE+pF6V/Lb7ACnZwQb/lXQF6t+VOSIZyclyXzNtxwiS5w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ypmq5fJX; arc=none smtp.client-ip=209.85.210.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f172.google.com with SMTP id d2e1a72fcca58-742c96af71dso4687077b3a.0;
        Wed, 21 May 2025 06:00:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832448; x=1748437248; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=Ypmq5fJX83L45870vvmJyzKQmuV/CAtkEWOTZo0195iRGWRIs8XofaCsLe1HVg+XRm
         Us7NAD6dnMHLDn9VTE1cZ25s1dwgZU7WwUQC4Jgj00FrP+fNcPukl8FwOWag11dAxZyM
         eNKltYl+m7THuhnRs2QXET6RES+UpbLqDHUPWzQv1GF7a1Ta7Ns1bhXCssq43inPDoj4
         f2/900sqnGKVB5tY4xFAGPq6cY2Ac6l/VitGeWSjZL5Z0fHn+CtNaAfbh9qGFyZHlFrJ
         kcOAhX02Sskdj1rTk99fndXOuA7Cct5cUJ+cyE5soHEKKG8fPppW55ze6NeB6x8MJpqf
         +M9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832448; x=1748437248;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Gxfsw6I6YYTP0VMGydqnNXEY5NLxoTpA+PjreYTGiOE=;
        b=u57j1sQjQNGx1OLYpeFaQXd/6cZKfo2h0QNmRW7XwKpTD0AccvLOXbp4DeuzIhJBOp
         XSK2GiuVKf79UysnaLr48G/luzjTTn4qvbQHbpUMyIN+iUdb2MHSmA3CDxoF8FUK69St
         FQpdLFcGXwn14OVwivZPIci+J+gu48U3rXV9uwTAembdI4IZFWxShDpIqNx3L1xq0mD+
         aVONcSl0//0wwybBJjNH25sklZiix/WZvQYfog3UCDeXFlHcYT9KtVF3o4ngjslpPQ32
         P710iC6G7NLpfYd1fBfyci1+0c3eeBL+Mj9oLmEh1ep+bLpybvNz0pFlXHgjdJWoKUIi
         EIdg==
X-Forwarded-Encrypted: i=1; AJvYcCUAxA8F78BR3dCOtJ9weusBvG4pmGjS9SPUJfgV6xfY7GJhXZST344mSCBOJx55eGd//LOh4HK+DQxFT/0q@vger.kernel.org, AJvYcCWr0ORSdrLPglnxkXm3dXZAl/vtMwXINSblAiEYzVH9N9OrDEo916ZVR3TH+ToZ0nujqC08lwLHSjAw@vger.kernel.org, AJvYcCXKbZAMe5JSvKgXH7a2Yh/CRu1SY5uHbvl0NaCXK5Wf6Mb8fVKtbrDpYPAslAHl9zmWs3vWFKRHQkCZwY3kuHA=@vger.kernel.org
X-Gm-Message-State: AOJu0YwehofdIz/SxZ47xBYjWpqFjywmljH/UgkxvdXsL0ZvgCXcjjx8
	zFO/Df4a4oR87gOK34v8e5vdFKeuOOYoz0gNSjd2SnCmwa5UOBe1voNHAHyjz9NldGs=
X-Gm-Gg: ASbGnctS1uO07O+IK+36qccJUd7MCIF5ggt9RZEB+71D8MoVo6QBTUmRxHtXeveIlvA
	+sY1M+pZk1o2Qzw0RevYx2LmnICnKICNNzJYg3QVQia+qDkClKouFZtMKwJu48Pxlq50+fCeKzB
	HmLSms6H4WX/dOSQKkArE/rkV2zIWagzX0G2NMXp8SKvbzXwdLBrSaHZVDqHlj/fa3JSQfCq3E7
	5Xoz0FEUJgLy3+PPkj9/ZbzCoxcUVGS1AUFEDVIjFXKvYJOztNS+fXq8FlSECGatImVSHfm3tfq
	QNyEqnRKPWDUQwfU5nylhZQ+IUN7DVZ0cncdiBJKU0nPftcZIL/9e+vaKhqOz7U=
X-Google-Smtp-Source: AGHT+IHOqZ0UZs4gEw+AX4EUEYHG80dDDTjCVGnktljkyCk/ragLh7hzOTShEwQSeYLdiStnlVCAxg==
X-Received: by 2002:a17:902:e78c:b0:231:d156:b26b with SMTP id d9443c01a7336-231d4598d28mr339129975ad.38.1747832437863;
        Wed, 21 May 2025 06:00:37 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:37 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Date: Wed, 21 May 2025 17:00:09 +0400
Subject: [PATCH v5 1/4] dt-bindings: timer: via,vt8500-timer: Convert to
 YAML
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250521-vt8500-timer-updates-v5-1-7e4bd11df72e@gmail.com>
References: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
In-Reply-To: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>, 
 Daniel Lezcano <daniel.lezcano@linaro.org>, 
 Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=3775;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=qFsMhUVZOqzuNFYPlJDTF3BR26c7gUmeV5+bIDXnEJ4=;
 b=LhCAByhFqlGUo6Nq77ilp47z/ScPwXJfgpi7qviGjTbF01bA30izGRkuZjaCmMafFFps7xtPd
 BJMqCf7+vO5C5xw71nbhC56FqYtATYEvdaA93wcmEe89lZs9XL8yFOq
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Rewrite the textual description for the VIA/WonderMedia timer
as YAML schema.

The IP can generate up to four interrupts from four respective match
registers, so reflect that in the schema.

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 .../devicetree/bindings/timer/via,vt8500-timer.txt | 15 -------
 .../bindings/timer/via,vt8500-timer.yaml           | 51 ++++++++++++++++++++++
 MAINTAINERS                                        |  1 +
 3 files changed, 52 insertions(+), 15 deletions(-)

diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt b/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
deleted file mode 100644
index 901c73f0d8ef05fb54d517b807d04f80eef2e736..0000000000000000000000000000000000000000
--- a/Documentation/devicetree/bindings/timer/via,vt8500-timer.txt
+++ /dev/null
@@ -1,15 +0,0 @@
-VIA/Wondermedia VT8500 Timer
------------------------------------------------------
-
-Required properties:
-- compatible : "via,vt8500-timer"
-- reg : Should contain 1 register ranges(address and length)
-- interrupts : interrupt for the timer
-
-Example:
-
-	timer@d8130100 {
-		compatible = "via,vt8500-timer";
-		reg = <0xd8130100 0x28>;
-		interrupts = <36>;
-	};
diff --git a/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..e748149948f3140d4a158f800b91e70bf9c4f042
--- /dev/null
+++ b/Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
@@ -0,0 +1,51 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/timer/via,vt8500-timer.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: VIA/Wondermedia VT8500 Timer
+
+description:
+  This is the timer block that is a standalone part of the system power
+  management controller on VIA/WonderMedia SoCs (VIA VT8500 and alike).
+  The hardware has a single 32-bit counter running at 3 MHz and four match
+  registers, each of which is associated with a dedicated match interrupt,
+  and the first of which can also serve as the system watchdog (if the
+  watchdog function is enabled, it will reset the system upon match instead
+  of triggering its respective interrupt)
+
+maintainers:
+  - Alexey Charkov <alchark@gmail.com>
+
+properties:
+  compatible:
+    const: via,vt8500-timer
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    minItems: 1
+    items:
+      - description: Channel 0 match. Note that if the watchdog function
+          is enabled, this interrupt will not fire and the system will
+          reboot instead once the counter reaches match register 0 value
+      - description: Channel 1 match
+      - description: Channel 2 match
+      - description: Channel 3 match
+
+required:
+  - compatible
+  - reg
+  - interrupts
+
+additionalProperties: false
+
+examples:
+  - |
+    timer@d8130100 {
+        compatible = "via,vt8500-timer";
+        reg = <0xd8130100 0x28>;
+        interrupts = <36>;
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 3563492e4eba48b9e9389687fc9ac2a881c47ddf..783e5ee6854b69cca87b6f0763844d28b4b2213f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -3435,6 +3435,7 @@ M:	Krzysztof Kozlowski <krzk@kernel.org>
 L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
 S:	Odd Fixes
 F:	Documentation/devicetree/bindings/i2c/i2c-wmt.txt
+F:	Documentation/devicetree/bindings/timer/via,vt8500-timer.yaml
 F:	arch/arm/boot/dts/vt8500/
 F:	arch/arm/mach-vt8500/
 F:	drivers/clocksource/timer-vt8500.c

-- 
2.49.0



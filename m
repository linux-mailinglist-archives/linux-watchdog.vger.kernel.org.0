Return-Path: <linux-watchdog+bounces-3548-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 23E4CABE45C
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 22:04:31 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id ECB6F1BC2DF0
	for <lists+linux-watchdog@lfdr.de>; Tue, 20 May 2025 20:04:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 957DA2853E8;
	Tue, 20 May 2025 20:01:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Oc0Q/56n"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f171.google.com (mail-pf1-f171.google.com [209.85.210.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0523E1FDE19;
	Tue, 20 May 2025 20:01:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747771319; cv=none; b=oxWATio4JnDuxCfX3u3buV/sHN77t+5peF1QbTfsTwwv3fiNmkwlJYm6p3HK0GzU4kv8rTQWLVhOT6BTyqT25d53h1YS/gwkdMQwF+Z11Thi1upqMviZzYOScbDghUVbFg298WL6HMg2qAEZ2QOl+MmePIWNq2ANkcOjW7u+XXk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747771319; c=relaxed/simple;
	bh=X/sQ9U42wLvVYm/jm36iRHzP6rqcVZHM8r3/rlxdmNQ=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Td8IWjCmzBk386rCe+iJqvR/93Gwhs2mu5Q5vcssXKZU7Js3vM7J4SxEcQfZkSw8AWLcjHZJuiKkEHKg9FTQjefZHv/gsBatO7asGmXojLH244sC9/SMN5sGTbnCoaXqSGOSE+SkFPsnAauOfWnA6BSkOf1MKAon+a79lPABC9Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Oc0Q/56n; arc=none smtp.client-ip=209.85.210.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f171.google.com with SMTP id d2e1a72fcca58-7406c6dd2b1so5939798b3a.0;
        Tue, 20 May 2025 13:01:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747771317; x=1748376117; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=pPcmUVfo51pXmHZ9ojjiEQMZRh/JPyF52AHVxpwFMmI=;
        b=Oc0Q/56nN+azwZFUATFT1LS+CdC9eFLon6RH6xeKduTjic4ws9/KmQAaQWHl2gB72Q
         g3oci4sEykikbBWYJeW9a58I5zHuwbvcXjU+7djpIZsOpHfkRRX7Pq4AOb6wLjDRebLf
         7mnv9xBz48iUhvZ5vLnlGT3lNGy99f4rYjRFZ7wPkTEmHfhmmmT4adUp0A3Fq/uFG9R/
         oB2M2ZBXfWwRLuYbH4J95Y8vz9RZ1YYRxQVd0qxbxJ/41/6RCGcsiy11Tl+04h4IEwaB
         kf4pXpvyzURx3ZAdtcDxg665VXbHb8bqTIP8UUQcUq7NtQj2hrkdUDR8bCaON9IKTIji
         weAg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747771317; x=1748376117;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=pPcmUVfo51pXmHZ9ojjiEQMZRh/JPyF52AHVxpwFMmI=;
        b=NprtQ0M9/o0G/QRF21kkOlibUnV+C31h3ey2cA70wDne/GytOKITybGvxaJIiQBoBk
         s1utcDRTp5RwBLVjgxE07LMVlnbWbzOl8XsOzqatlxII/6euQI/LFzLixEClo5ja84C9
         clTkJ92rBoU+SN1oV9gGMcD6XIsik+oCBXG6eZK1cqT8blUO0O0qK+d0A/FHK2eG2Bt1
         LrljwCmEhe/736Ds+dIrmwAi9/VeYWWcC3PMc0L+pxEJvIUz5WGdsbCL5CsGQew4F+8z
         aAYiNNoGUBlbLog+jY63ECJRJ+4GnxzxyCXiaFMgGagH1tZF4WP5ucQXWwJMRXUxMVyz
         JUXg==
X-Forwarded-Encrypted: i=1; AJvYcCWOcyeI0DamuKd+2QEA77Jn6wTVBEIXTum0aVRGdI8NLhxyrO/iREwxVJ+l7l3JGug+w8aET3pd+N2K@vger.kernel.org, AJvYcCXVuEMMrJ34YW4AkoPYNy2+oq6qFn5AKtqPU4AlUuC1dWqf2npOSO3cADn9t4oPx6tuB/uMHlDw/xMBLmaO@vger.kernel.org, AJvYcCXdlEgbJHE0/3y1aWe0lRoTPkYL3xz7t9iGkxNdHXMPAkqgGJxVWUCTMF4bdw6hRsa4/9sv9jRPHuxoyFNgwDA=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw+lcpT34J4l/Oq8kGeDMTXM7xP9Q5nRIGzc2qbBCc87W3y33oN
	VxEzgVNX2Kn5pl+7c7MT8gpkLvVompYUZDkp98u9pry0xx7CHSqvsA/rVgqTScnCKIU=
X-Gm-Gg: ASbGnctGy5ao1iL6L3wkv2CmhEL6ZwlIe8e0ffXrlwHt7toA0IhugnnBevE2I8JTPw9
	+WDIWeJph+Csfm34sgAInWG/y+qklBpNcW494Jtn4PWl7MhEkRY38+Qe1swIPOT0ov09i/+8LAB
	Ln1nCdk4ggRNs6tG/596Bnq9ttwsgkpQiaEniOWcny32XJH98YpLs9dTQeddohHwSsRBMvEhvYR
	QDDXlvYFoG/8O0FRWgHGuA1RVuZqUFmAJk8bk78XH6fDiPyZQ2wegnHu7d75FnPdSWWDWSeSaZG
	0uy8p78i2KyeDtVLSozLtJ5Yn6pAOXUV6Mj2nF3fRuZlpRH5++ApX+X+DU5pTh4=
X-Google-Smtp-Source: AGHT+IFDfd5LYctL/ma3wetrvw9FPRSRjagnju0MP6iGs3B8f4f2NE6YVaDaNUxJ9dcButcaLqSK1g==
X-Received: by 2002:a05:6a21:9614:b0:218:23bd:6927 with SMTP id adf61e73a8af0-21823bd81c6mr17554826637.6.1747771316799;
        Tue, 20 May 2025 13:01:56 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b26eaf5a0d0sm8412340a12.14.2025.05.20.13.01.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 May 2025 13:01:56 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v4 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 21 May 2025 00:01:40 +0400
Message-Id: <20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAKXfLGgC/43NQQrCMBCF4atI1kYm0yZRV95DXKTNtA1YK0kMi
 vTupgWhiILL/8F882SBvKPA9qsn85RccMMlR7lesbozl5a4s7kZAkqQoHiKWwnAo+vJ89vVmki
 Bl6UBi1hbjcDy6dVT4+4zezzl7lyIg3/MX5KY1jeov4NJcOCq0qrRTVGCUYe2N+68qYeeTWDCf
 xCcEEnSigq2UtInUiwQIX8gRUZQ7LTJiMLKLpFxHF+TCZ/eQgEAAA==
X-Change-ID: 20250506-vt8500-timer-updates-44a0d22cd720
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747771315; l=2752;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=X/sQ9U42wLvVYm/jm36iRHzP6rqcVZHM8r3/rlxdmNQ=;
 b=ObNId0mYyMmRRfVHG7E1scox/D8xYERNd1Gn9Sx3E23u2AVHDSv13RRB5hW87CpBqbf6nVbiz
 Mr6N7sJG12ZB9no73jbwx2S8e4i7YJ9P5ijAjLK9A5jx6OyuvG23OqD
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v4:
- Changed the watchdog driver to use auxiliary bus instead of platform
  (thanks Guenter)
- Split out the register definitions into a header file shared between
  the clocksource driver and the watchdog driver
- Replaced -1UL with U32_MAX in watchdog max_heartbeat_ms to make builds
  on non-32bit platforms happier
- Link to v3: https://lore.kernel.org/r/20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com

Changes in v3:
- Dropped the DTS patch already applied by Krzysztof
- Rebased onto v6.15-rc5 as requested by Daniel
- Split out the watchdog code into a dedicated platform driver, like
  timer-gxp does (thanks Daniel)
- Link to v2: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v2-0-65e5d1b0855e@gmail.com

Changes in v2:
- Included the previously reviewed binding change that is directly related
  to this series as the first patch here (thanks Krzysztof)
- Created a separate config symbol for the watchdog function to let users
  build a kernel without forcing watchdog functionality upon them
  (thanks Krzysztof)
- Link to the previous binding submission: https://lore.kernel.org/all/20250506-via_vt8500_timer_binding-v3-1-88450907503f@gmail.com/
- Link to v1: https://lore.kernel.org/r/20250507-vt8500-timer-updates-v1-0-6b76f7f340a6@gmail.com

---
Alexey Charkov (4):
      dt-bindings: timer: via,vt8500-timer: Convert to YAML
      clocksource/drivers/timer-vt8500: Add defines for magic constants
      clocksource/drivers/timer-vt8500: Prepare for watchdog functionality
      watchdog: Add support for VIA/WonderMedia SoC watchdog functionality

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 ---
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++
 MAINTAINERS                                        |   3 +
 drivers/clocksource/Kconfig                        |   1 +
 drivers/clocksource/timer-vt8500.c                 | 148 ++++++++++++++++-----
 drivers/watchdog/Kconfig                           |  15 +++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/vt8500-wdt.c                      |  80 +++++++++++
 include/linux/vt8500-timer.h                       |  48 +++++++
 9 files changed, 314 insertions(+), 48 deletions(-)
---
base-commit: 088d13246a4672bc03aec664675138e3f5bff68c
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>



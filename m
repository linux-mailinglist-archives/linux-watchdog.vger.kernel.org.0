Return-Path: <linux-watchdog+bounces-3557-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 986D8ABF50A
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 15:01:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 34E138E3AC9
	for <lists+linux-watchdog@lfdr.de>; Wed, 21 May 2025 13:00:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0E6D382D98;
	Wed, 21 May 2025 13:00:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="MuSrCp+j"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7AA202D613;
	Wed, 21 May 2025 13:00:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747832430; cv=none; b=ly1rbiECCXkgoK6oPDwgU+MzC5lfcw4MKgIWacSxJeN5MmxoKs7xmvygp4HOM4mx4vttT1t20LDC8n88b7mLq3tf3qlRwHJfjPNFApanSDdrPIwMmbu7LcWEaVs4kpIqCIPGBut5KBeSYyYn9FXypuHdZhv7rW5GBlNm5glEObE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747832430; c=relaxed/simple;
	bh=cdjF3TyDd/LgsIhw2etMRg5WSfJF62c9yDJ6ng08a1g=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Jfm1MRwF+fQNhXQfVsNyBf3Nh2Dp/L31YgHeaR/Nd1NnRrmljLiNZkv78B4kfNHUaG04V0C0gmEnE2UcDAWDJXkUgjfCEjpV900QaTOjRMbAsWFdiOPcPfO0UDLJEf5HoC75hNM3UDSZ5tdramgb+DaPleWXR0iFA9/Jig90yvY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=MuSrCp+j; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-231bf5851b7so52619665ad.0;
        Wed, 21 May 2025 06:00:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747832429; x=1748437229; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=HDXmWTsf7I1TS3xfzRIhPnHMEzq5/8iyDHno0DQJuug=;
        b=MuSrCp+jUdIBxKXckJmEvgUTXi6DIGSlew7AgLviz1tKTAYPAP0CmoAol27azGcK8R
         dGJe05u+aYrZSONRl+Gtctc5JWKUstca681LvLuotICv3vfbidjFE4PB3/XRY3z9Apeg
         WLqdQ7fuKYm8zvwqA02+FBat5EbLvMjTvthb8mDXHcUK1UnYlIF7UEGSYiQdmuFGHttM
         w9CuO78lsi3mO0xT5RwwoAqRLKCGkS09snU+KD3RJuSZhmBGQjwkPvBYzeLRHvqsQzMR
         gdoHoKoyBHj82C3zeU+rwyh2onYtqJUEiEwC45tkSo6GWcZGwXW5D29zhAgkQdsE59WC
         5miQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747832429; x=1748437229;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDXmWTsf7I1TS3xfzRIhPnHMEzq5/8iyDHno0DQJuug=;
        b=H3DiqKGLZKT+bpmBvtnsz930PCJcgpEfsZiUKej6Xo4Fi2OEbzhyf8x9Jbm5MmS43h
         63iBNCei3Va+DYcGJsIEPJT8+qOKf+7oFaftwnC/R0HRXTen4vHNsHiBLIX8hWtFS5pV
         UFI/uHq5ijbzhuiat1GO50doEjPjjj1NRmvu3bSgXx8kZJohjzu5VhZvWLI2nS42AG1L
         bNy2l5/twoZsd4vm0bRC6m7IIWSdXPrHwn6uFwuHGCguBHq+s3DN50dyaox/cjXlm1fV
         ATB00wmHmwP/QTDnJi+cD1fMO7wNR92Ubpbs9DoN3Ix3kOfEFXHgsJvXlwYfBBNHGt0J
         FUog==
X-Forwarded-Encrypted: i=1; AJvYcCVyDJE1QqWCGYr02r8i4qWyXpqyp2daccyGjXnuZApyQ/AtQfx2OrGL+Zq1Sphw4c9u7n3KC7PlO4JgSJ4B@vger.kernel.org, AJvYcCVzO48HQX/ui98RiDaR9X40Y6yo6WvukjQ6WJEUObwa1ucDBwxSPsjuiaNkLJ9XDSiJ9Qt42kyO5Gw3f92so8Y=@vger.kernel.org, AJvYcCW+vOc5C2miciDJiEORkj3Xlnhqj0UiwEgG68xOKKxVbkQwws1Dnd1vurtOArhFCKkraJCez2Yv+n5K@vger.kernel.org
X-Gm-Message-State: AOJu0Yw8lfqD35CJmAQmS7VWlL/LrG05MOw+pn4p6wFJrykkDNOq2Lev
	J5ZqBNooT/BN+Bs515nVUDRf/ZqIkDk/oJET5P8b6ObUWlJzlAcalAkTBZodyndZhAA=
X-Gm-Gg: ASbGncvrvleuVqHhMCujRHersqKZS/T3tZuZKeTfnr01nKi6IJjiKPQF3Qgigxq8Mw1
	Eoy6vDTzCDJUVelbWDYb7KCJaA+mDtH5QB/SftEa4hblUwDYkiKTy+zpkSJ/ug+bjlvtBiBKBhp
	Aj0C7q6zPX1EFFim8585poU1CKmuiOOEG4l1M0zzi9U3jqZi0ZTBtdjcJiXacqLSlQH8fhBPZwi
	7v7iqWEmw+WUR+NZmGlQafGJ4patPmBP2+XvskUmckJH6e9S4d+n6qBPb3R7QStk2XQ1luLU+p/
	VsO0COAifJjbuGmFKvPJtSgJENsCISvYj6f8V7hQTXzwJ6p58f7eHREalz4DmDg=
X-Google-Smtp-Source: AGHT+IETmfah9/Lis2umG8XC4OQGkFd507KrHD8I0xERoUCucaoppzoXMSBE2xqQNCQOuHekoDmfAA==
X-Received: by 2002:a17:902:da82:b0:223:635d:3e2a with SMTP id d9443c01a7336-231d451ece8mr285952975ad.23.1747832428328;
        Wed, 21 May 2025 06:00:28 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([5.194.95.139])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-231d4adb017sm92691165ad.53.2025.05.21.06.00.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 May 2025 06:00:27 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v5 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Wed, 21 May 2025 17:00:08 +0400
Message-Id: <20250521-vt8500-timer-updates-v5-0-7e4bd11df72e@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAFjOLWgC/43NwYrCMBDG8VeRnDcymWYS19O+h3hIm6kGrC1JN
 yjSdzcVhCIKHv8fzG9uInEMnMR2dRORc0ihP5egn5Voju58YBl8aYGABARG5nFDAHIMHUf5P3g
 3cpJaO/CIjbcIopwOkdtwebC7feljSGMfr48vWc3rE7TvwawkSFNb09q20uDM36Fz4bRu+k7MY
 MZvEJwRYvKqhg0RvyLVAlH0AakKgurXuoIYrP0rohcIqg+InhGvKzBOGcd6iUzTdAdlFno/hwE
 AAA==
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747832426; l=3426;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=cdjF3TyDd/LgsIhw2etMRg5WSfJF62c9yDJ6ng08a1g=;
 b=ma0iwc8DTqUhwnyyiYWa8a3KhHx8UmK1V9I9hxX8gPu9maQusfOU96vUNbxeR2Yz32R62AOnJ
 sql3vw+weXrDYalo/8YJEiMJIQc3r3esh3yLyU6b3iTkzxEemgwesrA
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
Changes in v5:
- Make sure the watchdog timeout value is clamped to hardware limits
  before writing it to the registers (thanks Guenter)
- Add a comment about the watchdog match value (deadline) wrapping around
  the U32_MAX boundary, which is expected behavior (thanks Guenter)
- Avoid moving register definitions to the shared header file to reduce
  churn: the watchdog driver gets direct pointers to the two registers it
  uses anyway, so it doesn't have to know all those offsets and bits
- Put the watchdog Kconfig entry with other ARM platforms where it belongs
- Link to v4: https://lore.kernel.org/r/20250521-vt8500-timer-updates-v4-0-2d4306a16ae4@gmail.com

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

 .../devicetree/bindings/timer/via,vt8500-timer.txt |  15 --
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++
 MAINTAINERS                                        |   3 +
 drivers/clocksource/Kconfig                        |   1 +
 drivers/clocksource/timer-vt8500.c                 | 166 +++++++++++++++++----
 drivers/watchdog/Kconfig                           |  15 ++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/vt8500-wdt.c                      |  88 +++++++++++
 include/linux/vt8500-timer.h                       |  18 +++
 9 files changed, 316 insertions(+), 42 deletions(-)
---
base-commit: 088d13246a4672bc03aec664675138e3f5bff68c
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>



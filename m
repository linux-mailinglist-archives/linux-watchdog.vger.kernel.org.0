Return-Path: <linux-watchdog+bounces-3505-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 44FADAB8F6B
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 20:55:38 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 2ADF93B151E
	for <lists+linux-watchdog@lfdr.de>; Thu, 15 May 2025 18:55:18 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 67FFF27FD6E;
	Thu, 15 May 2025 18:55:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="fS0JwnXx"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f44.google.com (mail-lf1-f44.google.com [209.85.167.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D71425A2B2;
	Thu, 15 May 2025 18:55:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1747335333; cv=none; b=rRneFmcZ4mN2Cb2MP0fV8CYvHsJ7I/SAEeER02czRDa1+aH2Mme+Q5pWzE4w6krWzq2kuqdoVnZHBGHpWMX3cCakVSZ1J0xb1vtrX89cc8lAqiVUkaj5MoxG/2hDXW/uSFpZm/ZSwnqBYfGCpG3Q7hM0tbfczFlFPVl5s/hsvtQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1747335333; c=relaxed/simple;
	bh=av7MD4mMWbcjnIPPFXuPllDbb3VzklZsHYR89QcuN3s=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=C8ASKZlFAs/YJd30EppLYsM0pbgGCIbJmeXSmt4Cr9XL2nLv/5BFXabe/EZ7BWm3Y/eQkjN6hrDID96NSsOEgMUHzofvpPz50xk+eNIA9aPSuaVVmKfypg30Bi50s7hAiSauqbYlX255DpuUP+Fl01uGjFBNL4++psbq24dUDlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=fS0JwnXx; arc=none smtp.client-ip=209.85.167.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f44.google.com with SMTP id 2adb3069b0e04-54ea69e9352so1748224e87.2;
        Thu, 15 May 2025 11:55:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1747335329; x=1747940129; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DfRo6ELKt4x2198NEXG1xb6DF2p0UDmeagAQl2snfz4=;
        b=fS0JwnXx/s7QNyl/xZwawJ9A82uD7PbKRrNaM74lt7HSbwL0Vs4QfuD8ShZ0JSI5O3
         ZSHD92i/muN/VZFjjSm01cSQmborBJ4G9sMPiqPN1abYncH7i0OU3G7K0RrUpoD/MId6
         gEkN0mL/sJzeG+quySZHFf2G0fmpq+kqBdAiOkVU3Jowbbg4z4n5fRbF7YExtZkBmbQU
         psSLq/Nni0zPsux8Jbk6fT+qxuKA3ieemSGjE6XuF+XWp7VXeESQ3Ef0ZcRdiGmLe/6C
         la/bwknpZv8NCMPSUVTnAHQ/svrIJcawusz7ZexHtX1YyWT+O3+/KpKYWOXX4PR1BG1x
         9YQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1747335329; x=1747940129;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DfRo6ELKt4x2198NEXG1xb6DF2p0UDmeagAQl2snfz4=;
        b=n6r0lpZAwXrkGCnlyYX5eFDMwM5FFXlhdzL30IKIaBKta9/xi9ACEp7gyksgPAO+hK
         IjNTydEeKkzWR19Nk6Zmog8lKBNUt/61WZLruaJ4Z9iD4LKeiclUVED+D4Nr0EYvcjAt
         lsSKUaAoVWkh4qaA0+6PGLWBdD80VVkQRrZNLFGSmzx4R9AjBZiIXhk8KxdivfsuZkIY
         wWG9MwoAam/VagnsBXM1V3mhO6I0oveIEMGXMAswi0LZUHmBjp8uMqWCZE2lHxUZFSgJ
         DMVSmphiDlic2AOJ13L4DS5DJAtJK3shNVjR18Lox5I3CxNaTLCA/0kxzLYSyIb56LCx
         YgGw==
X-Forwarded-Encrypted: i=1; AJvYcCULTmnRL1NK0ADgnSJG3QGtBQvR+rRWiYWmW6eB0xyHDihxpPMGqfLmNw3p5Tm7VudFdKdDGkkseVuslqLPHLM=@vger.kernel.org, AJvYcCWfTiRyepjnmR9BvmKQNmFscJBGGlK/mYYhBnVE6pvFmZigAQtAK71moTNPRbG7cHZIUH1c3J2phFJh@vger.kernel.org, AJvYcCXqC7hYPkvOr5gYR0kUXdMN9jk8v+GmPPyTzJzFPKNz9DxZgo5MPKI56mv2XKCVB2XME8L3BNgnSyBkHyBm@vger.kernel.org
X-Gm-Message-State: AOJu0Yx4vZ3Z+dfEtgN6LcQQeLuPYW1ytzCA2LPqKjD6SeLUwoYH2ADg
	EU9rOg3JHCg4bFsQifEFsAwQWhathsm0rPXb4NOpuaKRTgCndF0Ce8/m
X-Gm-Gg: ASbGncvvllMH9RMs0aVKB6l/5G3BmzU89m7KTK/APIU62xYh63UuCUInBw/G8nUwJgR
	9/UyknIvtGB9Z8yZ59hBX+X2kFC2tccD1979n5N131ZNPaxnwL2VEbtJiTKU3yjRTpmi9MA8ODP
	GSoI4Yk/lSfs/y3002sddSV+zK0ggVAV4aWXmUd82m+09h7FHNEshTqkfZxFC/G+Qxt2V/MqzJo
	/CeSNaVOhxfEeoaJmO5iXiRblSfVFNXHnShEgPWxKLMMe1Xifi6A66hv1Tt7KCJ1f8AuSPwft5W
	zcoFixjQo5qyn5D6meOgQ4g7J+ajMEz92I0S0kT3juab5BBOoWVta6zy9SdS9HMt
X-Google-Smtp-Source: AGHT+IGpHuxeyZPQUJiZA8Fyu6hdqyCtqrox5jsyjBCnoFL0xTxnzkYFiQFU+a64vXBUjStPlPqvfw==
X-Received: by 2002:a05:6512:10c3:b0:54f:c505:5c66 with SMTP id 2adb3069b0e04-550e71dd5cfmr147301e87.29.1747335329158;
        Thu, 15 May 2025 11:55:29 -0700 (PDT)
Received: from NB-GIGA003.letovo.school ([95.167.212.10])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-550e702dd8asm60389e87.196.2025.05.15.11.55.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 15 May 2025 11:55:28 -0700 (PDT)
From: Alexey Charkov <alchark@gmail.com>
Subject: [PATCH v3 0/4] clocksource/drivers/timer-vt8500: clean up and add
 watchdog function
Date: Thu, 15 May 2025 21:55:25 +0300
Message-Id: <20250515-vt8500-timer-updates-v3-0-2197a1b062bd@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAJ04JmgC/43NTQqDMBCG4atI1k0Zo0mkK+9Ruohm1IH6Q5KGF
 vHujUKhiy66fD+YZ1bm0RF6dslW5jCSp3lKUZwy1g5m6pGTTc0ECAkSFI+hkgA80IiOPxZrAnp
 elgasEK3VAlg6XRx29DzY6y31QD7M7nV8ifm+fkD9G4w5B64arTrdFSUYVfejofu5nUe2g1H8g
 4gdkSht3kAlJX4j27a9AX+V8l79AAAA
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1747335328; l=2195;
 i=alchark@gmail.com; s=20250416; h=from:subject:message-id;
 bh=av7MD4mMWbcjnIPPFXuPllDbb3VzklZsHYR89QcuN3s=;
 b=T29UCHGZkm/bweDhSqGMd/581k+VXd9wCK0LoUIMbTOR9DhmWr9ylFIVEFSc8Uw1bd6xcOk69
 1i26DIxiQ7xBa1MSuxhyAoBzDfmHQ/Z6y8PR38sDWmzxGt6SIhgtjS0
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=ltKbQzKLTJPiDgPtcHxdo+dzFthCCMtC3V9qf7+0rkc=

Add named defines for all registers and bits in timer-vt8500.
Move the system events timer from channel 0 to channel 1 when enough
information is provided by the device tree (i.e. more than one IRQ).
Use channel 0 for the system watchdog

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
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
 .../bindings/timer/via,vt8500-timer.yaml           |  51 +++++++++
 MAINTAINERS                                        |   2 +
 drivers/clocksource/timer-vt8500.c                 | 125 +++++++++++++++++----
 drivers/watchdog/Kconfig                           |  14 +++
 drivers/watchdog/Makefile                          |   1 +
 drivers/watchdog/vt8500-wdt.c                      | 116 +++++++++++++++++++
 7 files changed, 285 insertions(+), 39 deletions(-)
---
base-commit: 92a09c47464d040866cf2b4cd052bc60555185fb
change-id: 20250506-vt8500-timer-updates-44a0d22cd720

Best regards,
-- 
Alexey Charkov <alchark@gmail.com>



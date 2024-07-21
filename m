Return-Path: <linux-watchdog+bounces-1405-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5CAA9938591
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 19:09:14 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id CF6DDB20BE2
	for <lists+linux-watchdog@lfdr.de>; Sun, 21 Jul 2024 17:09:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id BCC45166312;
	Sun, 21 Jul 2024 17:09:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CPQbYUXU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pf1-f182.google.com (mail-pf1-f182.google.com [209.85.210.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5391B5380F;
	Sun, 21 Jul 2024 17:09:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721581746; cv=none; b=MSgDMQfVlvZP7uKbHeFNidVvftMVxSmBu7MJN9L4PN0DYc4SZAdYdVSy2svW2W/OfpEoAn9t8I1ODS7MOyC4CnuTrbQ1NRpAGVrLyIV4EnM7yb+nyIH7CDSm1oF3xda31SSQ3qTHS3iyNBojitxBaU58ZGRkGruKzh9cLVzLlpE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721581746; c=relaxed/simple;
	bh=feDAAsViFuP1+3uZ1bm2jmSYegUeV4rAnavCi+51RDE=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=Uun8ewzI5gSvdjov4lAJYyQNSNRZDRb5SSZWyswXejz17kYD9X/vW1boY9wGFBIOdwOJtWV+/o9l8u8W2qZwF49Ov+/QAT85OeJcTSdyal3nW6lQ5Wdg5F5pEsCTujpgnW2+i44rZ6S1fiqkCFb3/2xCN2bPJi1QyrI9raOxxBo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CPQbYUXU; arc=none smtp.client-ip=209.85.210.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pf1-f182.google.com with SMTP id d2e1a72fcca58-70d153fec2fso818282b3a.1;
        Sun, 21 Jul 2024 10:09:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721581744; x=1722186544; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=PtNzcJvKBuZrNFYDiV6cn2zqQI/QAT21K5UzHh9//vo=;
        b=CPQbYUXUkBsx15yHzacrxAmjoAR9kPv78A9KJvFomBdCoRJxUQGUVFWE/hqsUEnSod
         nfUGHaNfxCQ+v/oiwHaJ/QW4/JFCFsEJ+c0CvfCSKqQnbf6iRmzCbG35sMBnH5jKDtH9
         hmOGb+q4Gz0qyP7EH6s5/8okcd/EMpIbLppKLgsbro7v34pVvWSUo9YVucqqkpfJrWFo
         Y2lFvr3RuKXNQk6EWP1IFR6MyAutmdaDTlNFvjhh8CKy22Zf5PfGrgY6vGfTQQ3fnjGF
         u9/WeqEtqKe1Rjj6C6Jk5sF4pEaVlICdSDiwVWReWR/1Pu9Y8fFouUfrF8jZAVneKrHH
         O6uA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721581744; x=1722186544;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=PtNzcJvKBuZrNFYDiV6cn2zqQI/QAT21K5UzHh9//vo=;
        b=WBeC0CT8UysFoqxiPlBfYcoeomzpIpwkkhxX8PKRXa4TEVdKo+OIB0MKMA8nD0zMzA
         HMEgBDaWK7zfcF20cKVlIqaiR7ef9aXqZiLuBG/x3rQQlUO5X3RiJhK0KqJBvXqRBuQ0
         IgpJjxQF8jT84ECPYGiYsr2N1tnzb0c655gAVgS2X3eX4uWi5hvxG4eolfp0qVeQCMzK
         4H+kLKn1QSXS/6Yn8nz/Re+ELoglzsEnX3zxfE7ipYcN06OYLR2ogbZ5q0BK6zo4iyQn
         elY0HD1k2u04AnxVRnzcHHkbyjPgkZrpzvnLc1l86QQVawYlplzBHXA4wqD1fhBVFLqg
         ROTA==
X-Forwarded-Encrypted: i=1; AJvYcCXYByeratQCvrgoMXLZ2Xalz70h4cdrwx9tODIh6HIeF2tbQqTHgTKo+nq7LPrm4g1+5jUlJprHU0W5158a9hHae4zMhG8IbQm3cSHQoO8kQpd8DzDEVJMY7sRODtWbjfUspkWHMze1LgmCzIo=
X-Gm-Message-State: AOJu0YyL4YCCGYrtvOd2bngm+8/Sdt0D+MtHRRzy3RGt9Jr+tKNHQzDG
	kE31/NfB13hoy6g8uAm2qNoQ+0neJmZgKEeiomI/kcuNdi4C5oUN
X-Google-Smtp-Source: AGHT+IFTtUHvnkSRdnWOlMs5Fu7zljzheaLY0vB58SAfXDCcccZ3MZag+mGFYGlr1pqrj0bSLTGfmA==
X-Received: by 2002:a05:6a00:22d6:b0:706:8e4:56a1 with SMTP id d2e1a72fcca58-70d0eff027fmr4987285b3a.18.1721581744411;
        Sun, 21 Jul 2024 10:09:04 -0700 (PDT)
Received: from kousik.local ([2405:201:c006:312d:f66f:2b12:abd:60ff])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-70d285943e3sm417810b3a.213.2024.07.21.10.08.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 21 Jul 2024 10:09:04 -0700 (PDT)
From: Kousik Sanagavarapu <five231003@gmail.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kousik Sanagavarapu <five231003@gmail.com>
Subject: [PATCH 0/3] ti: davinci, keystone: txt to yaml
Date: Sun, 21 Jul 2024 21:58:33 +0530
Message-ID: <20240721170840.15569-1-five231003@gmail.com>
X-Mailer: git-send-email 2.45.2.827.g557ae147e6.dirty
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Convert txt bindings of DaVinci Timer and DaVinci/Keystone WDT
Controller to dtschema.

Some comments in-patch.

Kousik Sanagavarapu (3):
  dt-bindings: timer: ti,davinci-timer: convert to dtschema
  dt-bindings: watchdog: ti,davinci-wdt: convert to dtschema
  ARM: dts: davinci, keystone: correct watchdog nodenames

 .../bindings/timer/ti,davinci-timer.txt       | 37 ----------
 .../bindings/timer/ti,davinci-timer.yaml      | 68 +++++++++++++++++++
 .../bindings/watchdog/davinci-wdt.txt         | 24 -------
 .../bindings/watchdog/ti,davinci-wdt.yaml     | 52 ++++++++++++++
 arch/arm/boot/dts/ti/davinci/da850.dtsi       |  2 +-
 .../boot/dts/ti/keystone/keystone-k2g.dtsi    |  4 +-
 arch/arm/boot/dts/ti/keystone/keystone.dtsi   |  4 +-
 7 files changed, 125 insertions(+), 66 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.txt
 create mode 100644 Documentation/devicetree/bindings/timer/ti,davinci-timer.yaml
 delete mode 100644 Documentation/devicetree/bindings/watchdog/davinci-wdt.txt
 create mode 100644 Documentation/devicetree/bindings/watchdog/ti,davinci-wdt.yaml

-- 
2.45.2.827.g557ae147e6.dirty



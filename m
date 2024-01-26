Return-Path: <linux-watchdog+bounces-499-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8155683D8C4
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jan 2024 11:59:33 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7EAD8B3B13F
	for <lists+linux-watchdog@lfdr.de>; Fri, 26 Jan 2024 10:22:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 28B7255E6E;
	Fri, 26 Jan 2024 09:57:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="ACZYFugM"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f54.google.com (mail-lf1-f54.google.com [209.85.167.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 50AD710A28
	for <linux-watchdog@vger.kernel.org>; Fri, 26 Jan 2024 09:57:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706263050; cv=none; b=URSZ4VEYKuNKRLOO/9ORth0tPH5XMkSa8VFYZz3h8zRcmpdaR/oIrRzm7goxju4eGU+HplDYlRqrSgnDr+k8xMYSthuuhGQ/DgmhclVfLDWh7BiHsclltC13XmawIzwphx8RrCJeLQPowGp8AETj2LWxuDSjqmcrSrTWnJ0fDmE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706263050; c=relaxed/simple;
	bh=9X0YCXiCPSl+U1uwYM6fyvbzMxsAt15eysC37h6GhWk=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=VuACw2Luu1Bjj41xTCKn394GG5IRK7n3PdDpUGAIEFxZED+3oUsOWC++G8jZkXmV5pmv0XSy1XOvgwlgzvmLYRxdSUwL5ROLB5fsLfFB9CuRsUIrRAJNrZqJ7b1MMM6j4MrPx1ZvqGMftgesMG/0Nlu2e4cRj5olsyZX7FlQ6R8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=ACZYFugM; arc=none smtp.client-ip=209.85.167.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-lf1-f54.google.com with SMTP id 2adb3069b0e04-5101055a16fso233212e87.2
        for <linux-watchdog@vger.kernel.org>; Fri, 26 Jan 2024 01:57:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1706263046; x=1706867846; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ewTLwyANv9bkJgZe1agECghfnILfAveBkd1fZ/yoRfs=;
        b=ACZYFugMOjwralH3xNTiSX5MRZ35uc1P6BhXynurqEEeiDD5Fae2eraGw8AKXQ5WKu
         BPPMqnNt9+LhVO3BCFuVhS55gwH+peqEgn//gmEZQn/rYJwjNVPnL63GdxVtplUfzi0K
         fHI/nimMMXYEsmQHR2JYBA8evYYCW7b4U8epg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1706263046; x=1706867846;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ewTLwyANv9bkJgZe1agECghfnILfAveBkd1fZ/yoRfs=;
        b=fJV/wKeGuSQMLZmSlkSwsnpoUBUedM+WBccMJ0EV0sQlRgLKDu9qQ3I9qeHybwPuP/
         U9RZnXKhF8Ni1OAJR5nCV0lDHXxXbGPXFstnfMR9O99cUtXb2iejibZE32LHAj66SEZJ
         qe4ggyVNONXJceZFjvBONcJkp7QSgctAfVy25/fAFkl1iRGvjLjc/1LsT4ys0Xx+ekGl
         MgdoP9sIbtra3kYhuvD+AaCurF/1x2YmnG6f6uGmp4yXQ83B9lE92MJKsb/vJ7uamSrx
         E+/TxSTrPEyNxHk7+bSdNBBz32tYqu5C+HYH2QRKUTKMRbJyghtHtyqe6OBHnt3tMPzE
         v0YQ==
X-Gm-Message-State: AOJu0YzV/VwOEC/xzseNY6CVf8WyMrICPzYyjrE9ALafG/yP7dUiSvX2
	J9qyhW9thEc12ITPaqUupqkRGnATTaUjxyAAoCQWKMffm6KjlRgiULDzd5fG1Q==
X-Google-Smtp-Source: AGHT+IGxDw13YunS794kdvqn7kp/gxJfjNaXPluRmSKwsiMmWp8vJ8G3bPl5Vc09lK6yGBVnIzVzLQ==
X-Received: by 2002:ac2:59c9:0:b0:510:1567:daa8 with SMTP id x9-20020ac259c9000000b005101567daa8mr554200lfn.106.1706263045738;
        Fri, 26 Jan 2024 01:57:25 -0800 (PST)
Received: from cracow.c.googlers.com.com (138.58.228.35.bc.googleusercontent.com. [35.228.58.138])
        by smtp.gmail.com with ESMTPSA id b16-20020a056512071000b0050ecae41c51sm129041lfs.135.2024.01.26.01.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jan 2024 01:57:25 -0800 (PST)
From: Lukasz Majczak <lma@chromium.org>
To: Gwendal Grignou <gwendal@chromium.org>,
	Tzung-Bi Shih <tzungbi@kernel.org>,
	Radoslaw Biernacki <biernacki@google.com>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Lee Jones <lee@kernel.org>,
	Benson Leung <bleung@chromium.org>,
	Guenter Roeck <groeck@chromium.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	chrome-platform@lists.linux.dev
Cc: Lukasz Majczak <lma@chromium.org>
Subject: [PATCH v4 0/3] Introduce EC-based watchdog
Date: Fri, 26 Jan 2024 09:57:18 +0000
Message-ID: <20240126095721.782782-1-lma@chromium.org>
X-Mailer: git-send-email 2.43.0.429.g432eaa2c6b-goog
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Chromeos devices are equipped with the embedded controller (EC)
that can be used as a watchdog. The following patches
updates the structures and definitions required to
communicate with EC-based watchdog and implements the
driver itself.

V1:https://patchwork.kernel.org/project/linux-watchdog/patch/20240117102450.4080839-1-lma@chromium.org/
V2:https://patchwork.kernel.org/project/linux-watchdog/list/?series=817925
V3:https://patchwork.kernel.org/project/linux-watchdog/list/?series=818036

Changelog
V3->V4:
* updated sizeof() argument with pointer dereference
* added cros_ec_wdt_id to the driver structure
* "mfd: cros_ec: Register EC-based watchdog subdevice"
  has been already applied to the for-mfd-next
V2->V3:
* drop "-drv" from driver name
* use format #define<space>NAME<tab>value
V1->V2:
* Split into three patches
* Supplement the watchdog configuration with min/max timeouts
* Removed struct cros_ec_wdt_data  and get aligned to watchdog framework
* Simplified suspend/resume callbacks
* Removed excessive log messages
* Reworked cros_ec_wdt_send_hang_detect() function to be more generic
* Usage of devm_* allowed to delete .remove module callback
* Changed MODULE_ALIAS to MODULE_DEVICE_TABLE
* Moved clearing bootstatus (on EC) to probe() and thanks to that
  got rid of .shutdown() module callback
* Fixed/removed comments, removed unused includes and general cleanup

Best regards,
Lukasz

Lukasz Majczak (3):
  platform/chrome: Update binary interface for EC-based watchdog
  watchdog: Add ChromeOS EC-based watchdog driver
  mfd: cros_ec: Register EC-based watchdog subdevice

 MAINTAINERS                                   |   6 +
 drivers/mfd/cros_ec_dev.c                     |   9 +
 drivers/watchdog/Kconfig                      |  11 +
 drivers/watchdog/Makefile                     |   1 +
 drivers/watchdog/cros_ec_wdt.c                | 204 ++++++++++++++++++
 .../linux/platform_data/cros_ec_commands.h    |  78 +++----
 6 files changed, 266 insertions(+), 43 deletions(-)
 create mode 100644 drivers/watchdog/cros_ec_wdt.c

-- 
2.43.0.429.g432eaa2c6b-goog



Return-Path: <linux-watchdog+bounces-2366-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id D563A9B3FC4
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 02:31:44 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9A31A283205
	for <lists+linux-watchdog@lfdr.de>; Tue, 29 Oct 2024 01:31:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 46C717DA82;
	Tue, 29 Oct 2024 01:31:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="elYMcl+u"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7618C7DA95;
	Tue, 29 Oct 2024 01:31:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730165481; cv=none; b=OBHKjwF4Y0TUzOOOMmJ66TG8fG8vpLu440UP8VYhxmdjBK+Yl/ivpJSvlY/9nEMxpnm8SmDYo5LSh+P2oB70zvvdm3ahujDZsHAsHsXz1BsdLbHbTh7QafgNLkc8cFztDulM2hlIdwfo1bTIAQBzDK9ToTSfz6E0m0YZJDviGno=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730165481; c=relaxed/simple;
	bh=6fAcAqpXTciIBerQvj9NeAzXhK41rLKSjlVQqYmzxWA=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=UBYF8xTDixHq20mnmxdUQZK9ckvVj2QMQ4+tnufsLDOIve2tAoiw0X4Dv4B620Moz91xxMv+SuehrBqlI4mTIrV3BdTcW0zhRNv2XaSQkhRCYA20fDRSel+aQp/lp0kp9iGhrdT/NDXygiWv3hSrr10frTG96DCCagpxFunxRBw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=elYMcl+u; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-20e6981ca77so52748085ad.2;
        Mon, 28 Oct 2024 18:31:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730165479; x=1730770279; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=;
        b=elYMcl+ukd4UA+QnzrsHbMonX6ByCpwKO00MMjs857RGmiGiuw3BTg9jMUaJ8DYc0L
         ulH6bdOgVGRG7Jc2mulNgPbev0YBNKYM3f4Vi851gaXbfj8eXSy+GBXgyOd8Taelas4o
         +caofcci2eszb6VL60vi7W3A0DR/2eM/yJ4BcysExsCotyvbJrYgVFSNIohWGjg6jopY
         4pEQxxm39v6JqprHuC2kCj4M7vN1jC9sarnCEZcxtdKES44M5DSj6jUd80RwJjBTYsNw
         BsQXrTw4h5aZX1Y2KxO4FNGioL8DmYux/rJGYpiZhNi49M1YWpPRh5LGt00AURrv0DMs
         15rg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730165479; x=1730770279;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mTMUiHHYVMRUoicKPTQrikup5KdhwmqMJsFGyJ97y1M=;
        b=GRhsjURW2TVkrPBfqTjWOaoR9wUT5MQMN4wCCn0ECDx0CVNAexUtQeEVlMKl8EH/wi
         WtZBvc1JzspoAfR7nMBoWFdPX+Xd5SrfWWQk0/vZRJECyu3SnrotabZmWtQWj6NnUete
         IgEndc4hyYkXtLuQDdctg6S0kJ4IiNLqcGMrn7CC+Tf3snGIBsB2iWiYuVR0DHgKMezW
         tVbXoTsm2mKnzTvWoM2dPyllCuIwvmSNEEI0YK7rRtfU+nS/uRf5qdNoBfLb+7zLQ73f
         1REhrTqxm/EcsvgkmOmYz94up2FkGbpIl0fyO3PKCndmJGXIIan5CYn2dPuQyQqZDGg5
         n/Jw==
X-Forwarded-Encrypted: i=1; AJvYcCUqRrk1sA1K39+iW0Zdk4eqIyy6I0FG/rnOZvuwOcdaBoaNfaCWd7QmI8gVZNBmAIzaPgD5Xpj+u7hqNLf7wHw=@vger.kernel.org, AJvYcCXv9tZHOsD+ulvS18S8bQEgEsdixsCJRGwGnN04q3/B7y7dCPv/deb/JzB0sqWV2BV9hlE/4TVWfPCGvbI=@vger.kernel.org
X-Gm-Message-State: AOJu0YzDM7WwUI05Z5njyTs3K+O2DMAO3Au5Tpzm2UdLtqwRcrQaFSfX
	3pp1wbqQafqRMaMywLr7YWjY+WnQ6StURzehxYBBLMQJ/Tv3/TNX
X-Google-Smtp-Source: AGHT+IHpTVvjwrQ3EcoGKK0bmJ6jA8y24xXtEro+uTiZy8kx8QQbwEUeJniOAu9P1ssNSK/aTxA2WA==
X-Received: by 2002:a05:6a20:e30b:b0:1d9:d5e:82a6 with SMTP id adf61e73a8af0-1d9a85169f1mr14366765637.45.1730165478664;
        Mon, 28 Oct 2024 18:31:18 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-7205791e564sm6686529b3a.17.2024.10.28.18.31.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Oct 2024 18:31:18 -0700 (PDT)
From: Nick Chan <towinchenmi@gmail.com>
To: Hector Martin <marcan@marcan.st>,
	Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Cc: Nick Chan <towinchenmi@gmail.com>
Subject: [PATCH v2 RESEND 0/2] watchdog: apple: Increase reset delay to 150ms
Date: Tue, 29 Oct 2024 09:29:16 +0800
Message-ID: <20241029013055.45538-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.47.0
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Increase the reset delay to 150ms as the Apple A8X SoC can take up to
125ms to actually reset.

Since the code is being modified anyways, also fix a bug where watchdog
writes were not actually getting flushed after requesting reset, depsite
what the code comments said.

Changes since v1:
- Fix an existing bug where watchdog writes are not flushed

v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com

Nick Chan
---

Nick Chan (2):
  watchdog: apple: Actually flush writes after requesting watchdog
    restart
  watchdog: apple: Increase reset delay to 150ms

 drivers/watchdog/apple_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: dec9255a128e19c5fcc3bdb18175d78094cc624d
-- 
2.47.0



Return-Path: <linux-watchdog+bounces-2069-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 8BD2F98C413
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 19:00:45 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id ED93C284532
	for <lists+linux-watchdog@lfdr.de>; Tue,  1 Oct 2024 17:00:43 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 337881C9EC4;
	Tue,  1 Oct 2024 17:00:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hEfqLygy"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f49.google.com (mail-ot1-f49.google.com [209.85.210.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 661701A3A80;
	Tue,  1 Oct 2024 17:00:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727802042; cv=none; b=YrKS1OJIB0l2AGa1m48JJPQFPCMT7/7O5hwtqOT/QB7xegR3EmswYQ06eR23VeW8Gcn/hMUzwHxY9gB/FiwkZePoeAlcUbGA/iYKEB7WdU9ilxbQHjgMU8xEzK6qNMutn7L1EbkJvCv23n0T+A91vRgVU0v9zB87rCP2YjiVORM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727802042; c=relaxed/simple;
	bh=A0gLps0VqNrD42zdu6s9fwhZ0eP7bRGJm33qpT654ec=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=l3ESNjxiZmppDf9pTvN52MptbxaPluEHav42VL1uueaI4NGYS1FsMxh8z0vVVZa1/bPilhpF5UBtcafB5zFcwJ7+zAKRdWsUEW3WA11no5JAEZMOJ3Qa+1mSJ25uHwzOmXHGHG8cn0xuaLcEe9mdpnJoL+bv46uYrZD8lNcFFns=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hEfqLygy; arc=none smtp.client-ip=209.85.210.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ot1-f49.google.com with SMTP id 46e09a7af769-71100987d1cso3566834a34.2;
        Tue, 01 Oct 2024 10:00:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1727802038; x=1728406838; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/QFFRq6FbM7/+BnU4Q7XaV/HWPgLY/MsBemdyytLyHk=;
        b=hEfqLygyowhdKfjMyIb91IC9vVjdltVEwV0+xuRAalDX8XRMXW9HrLCkrwLjYimGx8
         YZduLNHB8SEXxy6LDZf4BVNce1GGKVmIfV558empsfDy5aWTYwiV51RxYU/4JEU3KWGI
         LY3NA6arRUjhZgu3KIlCsfiDe5u1VdbVHTmdzLQa6IHeLpn8IrkZ27ERgzaOXx73vAYR
         Wllzlyhgp2HMZ761l1iLiF5bYzPS/r60P0n399jfTgbUrRye4BH47akaOuQjdHgDDaUU
         rf+VzCLzFIEiQpgmqbgzgdSVJjkLFbeP62ki8B0VEd7zcxRd5v2ehO7qyvgdXHEI3oE6
         Hprw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727802038; x=1728406838;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=/QFFRq6FbM7/+BnU4Q7XaV/HWPgLY/MsBemdyytLyHk=;
        b=BglV0jjRimbqmzVhRAuT+j2nnodr0DZSeeGCZ2+53LCqiYn/VxwfQghgHR3ebCS6R0
         jghnw6kGBLaSBgV6R3R3Y3LTUipO9nbtHqQK6pjfqX2xU0VYgtvom4xYQoG3BIjot+Sx
         4Xsf3i3APz7UnhjLlXdhH5nBLc6aFAEoqplRN+DBZH/SVLDp1AaDoDFIQh6I/ZirjcgJ
         KnYd+KRI7FcUl5S4bkdgZ3U/1zmubbG8rBZDdqCC3ZCNHmJPqUCfRe+jhfRKna3bbo5H
         Hw8ApITRywfr2zq20D6oIS0RJ02gMeqSBlKl3fYwcL+uTLorbbET6lMnNvu2Yh5pxtaE
         Qj2Q==
X-Forwarded-Encrypted: i=1; AJvYcCUQda8Zf8WUPQzXl4BDp82WXiXkxbeTKO8N/R8Gzr5vxQEsdyZslH5vl1ZvscP+WLlgM9aubCd7inTfFZA=@vger.kernel.org, AJvYcCXZJatndAnvpKFqihL2jDbASNiEzJkZVTyKlv79tRcAv5MHX9ZyQo2jkyff/1nFKFwef8HdYT9kSof/QQEuzAY=@vger.kernel.org
X-Gm-Message-State: AOJu0YxPtqKTYWVUlXOKpsotYDgbqwP3fUivlg/3rCpUfh9nxFBoxWxi
	7GwK6GPrqTKiSMrnja2iDGEA8xWtWoOk/WxJxvavkTPK7a4rrHid
X-Google-Smtp-Source: AGHT+IHFMj8zmgWl46T4cvkR9/THnVuc/vRc0F0i12hVhXq+fbmktXRXE5UFCsX+OXeQgnrURGw0NA==
X-Received: by 2002:a05:6830:2682:b0:713:7e2d:225a with SMTP id 46e09a7af769-7153cde99b3mr295707a34.22.1727802038169;
        Tue, 01 Oct 2024 10:00:38 -0700 (PDT)
Received: from localhost.localdomain ([59.188.211.160])
        by smtp.googlemail.com with ESMTPSA id d2e1a72fcca58-71b2651623asm8234054b3a.120.2024.10.01.10.00.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 10:00:37 -0700 (PDT)
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
Subject: [PATCH v2 0/2] watchdog: apple: Increase reset delay to 150ms
Date: Wed,  2 Oct 2024 00:59:50 +0800
Message-ID: <20241001170018.20139-1-towinchenmi@gmail.com>
X-Mailer: git-send-email 2.46.0
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

v1: https://lore.kernel.org/asahi/20240930060653.4024-1-towinchenmi@gmail.com/

Nick Chan
---

Nick Chan (2):
  watchdog: apple: Actually flush writes after requesting watchdog
    restart
  watchdog: apple: Increase reset delay to 150ms

 drivers/watchdog/apple_wdt.c | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)


base-commit: 77df9e4bb2224d8ffbddec04c333a9d7965dad6c
-- 
2.46.0



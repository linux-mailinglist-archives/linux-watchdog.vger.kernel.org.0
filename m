Return-Path: <linux-watchdog+bounces-4012-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 97B4FB2B750
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 04:52:35 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 68B807AB194
	for <lists+linux-watchdog@lfdr.de>; Tue, 19 Aug 2025 02:51:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id DE9892882DC;
	Tue, 19 Aug 2025 02:52:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XOFmwNR3"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7F05515667D;
	Tue, 19 Aug 2025 02:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755571948; cv=none; b=onGkF4cNhVNhTCqjjlPMgW49tDCwFI/XJlDkJ2Jp50qW50ivWxoTMzYM6QiJW0CLzp93hvIKPsck5pTCMabOd6S7b2+BhxPF5zCtTmn5NuoauHbwguiQETabEOxMWvMR4lEbPI4vBCRAipfmTowf1fm/ZQ4W83TYa9Zq3ZqVo1Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755571948; c=relaxed/simple;
	bh=8TCDh9v9syqCZtg556uYdrY6e+WV9Cbbz9FZAISmjwU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=a7s29PvdSGc/0MF0WJi9vFqAine5T4ezLXJy26IgpcAYjVYbniwj61B5OBSdAMsLSNCLIGCmVBg0ZmhI6mtrT/tZHhx4NEfHL0g1fQIbVG1WhaCIUjQLfCITC3JRSSTJP8l/wbWRIuA6eG9hVFHQCKNHtdika9SH0pv1oekVdq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XOFmwNR3; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-32326de9f4eso4206326a91.2;
        Mon, 18 Aug 2025 19:52:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755571947; x=1756176747; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=CH2KwpNP3L6st9s8ZTQdVOKVVct0EtCDxjQxgfg+SPE=;
        b=XOFmwNR3lfcAcVvADEu0l9tV+J7/0V/7CsWTFdiUSlKy+BV9HPlTD3PlVKYITKH27o
         LoWu1DFt+hI9p49SWDkVkCShl62bEiewAYpsq2KzUUnkfDq6h8fzWFPSLYe0x8c5Kqqy
         3hGdphU85VuehdY9I6KwWmeOoATZscr0QpYqUPrqo/7a13coY79PwDVyWAgVdWk4koeE
         M74i7NzLsmgzPYiWcDBt1wocoYVLtCC0Rs9f/9UAo0LRdhf3/AbZdloAQy/qPPVK8O10
         3kvq7WtevaV3Im7Qbe3pxluLovT1NDqUu/0m/yhOmoU/5dQEjpQ8PKm1pjf/OyHMMyLe
         DZ5g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755571947; x=1756176747;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CH2KwpNP3L6st9s8ZTQdVOKVVct0EtCDxjQxgfg+SPE=;
        b=wQzAH+lphYhejB9YJPrP2HyukOlX6QrSxh3GCIdq46hFDRDasKCe5HUnVNufQYv/iZ
         24UfmY/tF7srVOnfZ+noaMkvIb7dumuFKaTjo60kb7qNcbiydO+3K/oecP12ZkvzaCCX
         5eRQfcu/NLtvvfwVD8Aor+RQdzUXK940niiRxf9SmwKHzujjojFsyvRwQRSEbjzYRFpM
         Bz8RbKWAPrSNZhvSif2S5mKdDTt9L4EYC9raUVCyJ1LKOrrVleQ4/leWYWh8jKjD26Rt
         23jDaGIq9F9YYqb2FK1opolucb3xZudUorm1hjIYr5N4V8blC3VvVqBNJOdndBZk+QLs
         cuBQ==
X-Forwarded-Encrypted: i=1; AJvYcCVHmWneQG1oxiI3q8MKDICX7+RhxLQyVVUI5jJBFMQeM4dLtKjtslZu2ZA8gp1yGniFlM5CLOR8HMgDAszSTFU=@vger.kernel.org, AJvYcCWRamwbEahXpDR0Q5Yhle3WonXjSnGfzUbO9AcIU4EUTsjNNFB3Ib59cDshiD7GR1/TllS2GP4aoCM=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjZ79Iczce/HX9xgIh7p8TEDs8jYesdkHIWyUApvIsQAUTRn0e
	bBbnwXzEeRn8pPuPNwkmVS3q8SJl+qX8zSCCnca/bmbZ0LYXDTPaEpzoyGnqLWTFBrs=
X-Gm-Gg: ASbGncsBUBaFhZZy8CBGqYwqU/+E5LWVVNsar3FbQ6D9IGnWkSvYSpGwd9/TCGzlk97
	HRPMMVe5jYtp7qpJGDjee7Nn0mCIoZRxjOgyYrJx0PUq0yFihV9CtLAhOo32A8015fdL5MeNOIp
	/ZtD12EInYE2FouO1qOa47bjt2N8aRLqGUI0kth8Q6vvhBrIM4e8wSlOHvwxhtEqCvkFoVAE5YV
	9eEjJXW1PWocaAee40mKzWBJ9ZDVip13GMeb4BTT4X+jvOxVnxOYX8FLsbm1qFtHv+nnYIOrGG+
	d7GkXIyjWfYZLxBojTUaDYLT/qxntSMd3r2ntyMl4Jq5/lm1TN10vJ7GqnX5ZV5J8FYeJN37rQS
	wTKiM+GmDLKoOuTPOvZqlQj32uaxxUBqvpdY=
X-Google-Smtp-Source: AGHT+IEhwZCEHI+dkYJ3BI51GnhpHUygOZNkzScZtnkzkKJms0O4e0OOM2+qIMxChVoyeIS4mD36Fw==
X-Received: by 2002:a17:90b:1d85:b0:31f:12f:ffaa with SMTP id 98e67ed59e1d1-32476a4a2c2mr1561335a91.6.1755571946518;
        Mon, 18 Aug 2025 19:52:26 -0700 (PDT)
Received: from linux ([223.185.134.58])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3237e3ecc64sm1315532a91.15.2025.08.18.19.52.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Aug 2025 19:52:25 -0700 (PDT)
From: I Viswanath <viswanathiyyappan@gmail.com>
To: wim@linux-watchdog.org
Cc: linux@roeck-us.net,
	corbet@lwn.net,
	linux-watchdog@vger.kernel.org,
	linux-doc@vger.kernel.org,
	skhan@linuxfoundation.org,
	linux-kernel-mentees@lists.linux.dev
Subject: watchdog: cpwd: Clarify wd*_timeout parameters 
Date: Tue, 19 Aug 2025 08:21:09 +0530
Message-ID: <20250819025159.6292-1-viswanathiyyappan@gmail.com>
X-Mailer: git-send-email 2.50.1
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hello,
  
        It's easy to misread "timeout in 1/10s" as "timeout in either units
of 1 sec or 10 secs". This change should clear that up.



Return-Path: <linux-watchdog+bounces-2930-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [147.75.48.161])
	by mail.lfdr.de (Postfix) with ESMTPS id 5F798A35C77
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2025 12:25:52 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 7C2FD7A616F
	for <lists+linux-watchdog@lfdr.de>; Fri, 14 Feb 2025 11:23:12 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 0C139263F29;
	Fri, 14 Feb 2025 11:23:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="U0xmDFx0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 377C7263C88;
	Fri, 14 Feb 2025 11:23:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739532190; cv=none; b=lAQX/b/azS4ZLF7wVTU36KOmWN88/HKAQ0WaTFzQruJ4xrwH8gWdGY7ENlsS/TjYUv27q1ORq9/KpCcIg5xNnTySSKgJqOj/r6d2Am9XKotVv4DXcOI1bqG83ZNDB+ZHY3O2dUK4/wMn6CxdnWiF3Ug4LOTxGFz54Lhs4/Wmeic=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739532190; c=relaxed/simple;
	bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IW/1lBm0j729e81RJu7pKhhAxLtuY1CBYL2KlcQtMTmoYMOFQ0/wul/an2gGez1TyDZAIKjFxgcc0mSmkZ4Ztk8Sek6YebyZqoUp492FwWwPhZffYsqKivykwbflAXpm6AuOIWgCzWCAsDljLL4nHvwpbwAyLegAssPcszq0bi0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=U0xmDFx0; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5dcdb56c9d3so2940545a12.0;
        Fri, 14 Feb 2025 03:23:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739532187; x=1740136987; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
        b=U0xmDFx0RLQQxTionAvwtW7vGlhQv9ke+eSu98/SNSvTw9fi0fdp+jKbuUvAPD8tQL
         zWHQ4JDge4S3aoXLUS9laWQyvGS61lpJXOzchJWbMpH63JgdDkUjSO09wsIdY4KPosZR
         TmD1qfrCopnQm3YTlxBqfddD3TqPONzI+qmSfo6STWiPBCFKY7LRk7kuVh3eFybW1l7i
         eICPkcggKjuiavykvsMf+GaV0n8ruKPqcSxYX9tIER7pN6ZdUdmPBq1yFMz2IMfGfOs4
         d9qq2dUvfbStTUkrnof/Icpmb6xyKqWDGNNjfhL9IquLjdENhGw038ccnwFtUi+XneYC
         dK+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739532187; x=1740136987;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ncfBDs1BfbjE8HEdMRv396XMxgyF7oxwkpOZ9BEV/sg=;
        b=mUh0PnTM+Q/ON2VgrtGryz29Wu0ZcMH8mVDTG4PClj6uWIgit7vNzf9fcO7bwxBG/a
         Ban3vYHjS/kW1gOsYsNnij242/P2LPzfULMNU+wqICdZmlalGXztY2twBf7FxcoExrOH
         bBTQ65cE6A8tmjSGAbM1TLMwIRMaYC+LOrs973JlP5oM4v3iBsUd3iEz6ts70ECAg5xT
         yjARUaha1BkZk7UzNq3u1IdoozunEWgzpi+SYA9U5eDRLRLqcMNg5aMpA4dfEhHDe/qB
         Nl9o1e1gFJJQJgQu8N+qI4d/KBAX0fpISMnFMU0k545LqpsXqE9MaQUw+U6eslwNowNf
         Dl5A==
X-Forwarded-Encrypted: i=1; AJvYcCXiYzhOROso9DEN8H/IL7Rs3XEeH/PywNbH5nXBlCtBqF5eKkBgZbeFHRKS8yCzxiJz2mzBNRb+4BjoLfQ=@vger.kernel.org, AJvYcCXk2UJcw5jLJbH3TldB7DILcYIXGvoS3+mjSF7UcFBjiWBgw5TNUwvc0DpfplHSkBY6EdCKMVe7UxWaW/SQdD0=@vger.kernel.org
X-Gm-Message-State: AOJu0YymwBvrsfZTXBwXoPl27AGS1Xw81zBeo+LRnOZazHRXC2RTChGL
	Vc5rEtYCNLnq4gGLHzlL7TT9kBFLP9k0p8DoB8ryzGc7m6UzLsIh
X-Gm-Gg: ASbGncv4dnFEuBB9OnhPvGX5cjnrMdU/XDdqdSRu5ZDI5TYgt5+16O2vWR/ik83ZSgX
	VMvpbsUhil9lsa7NOTZA//kg6dK9jocEh5hUvuPOblYYg92x5FgIxiXYzwjm0JJmYPsDKrUXUcP
	RSeZ/k43v9cMBwSeiEl52MVB3dZ1+R8vzD/SE2osJUqvuBQElFLe+3yjpqYyfHk31BGP0QMcutd
	4jf/jti5XmmyJxkiUwGqbCr367q5jN2o2icB7hcoGAgKTB4D96+GqXqed9rq7Vdk1GI5gZyCw/Q
	srv7xKfPpaz554c37ZN65CMsP3t1w9V958WL2o8wVatn5ShjT2KI
X-Google-Smtp-Source: AGHT+IEruA9as/oJ+0B7yZpR+Du0MWt57ncaMUqTh8cPjv7Ydql7nmgBG5oMdHqeXfUBIja3MTJxOg==
X-Received: by 2002:a05:6402:458c:b0:5e0:2d53:b2a with SMTP id 4fb4d7f45d1cf-5e02d530e00mr597835a12.3.1739532187306;
        Fri, 14 Feb 2025 03:23:07 -0800 (PST)
Received: from Junction.dargent.eu (242.76.29.93.rev.sfr.net. [93.29.76.242])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aba532594a0sm329434266b.68.2025.02.14.03.23.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 03:23:07 -0800 (PST)
From: Regis Dargent <regis.dargent@gmail.com>
To: 
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	linux-watchdog@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2]: watchdog: sunxi: Allow watchdog to remain enabled after probe
Date: Fri, 14 Feb 2025 12:22:53 +0100
Message-Id: <20250214112255.97099-1-regis.dargent@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
References: <CAGb2v67tmzGfcFPchjzfSima-sT_u7viYd1UDGB9r6ZeJEgdyg@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit


I (tried) to fix commit format (still learning, please comment is something
is missing).

I made the suggested code fixes and added a sunxi_wdt_read_timeout function;
it was a bit more touchy, as the HW timeout could be set to less than a second
(really?), so I had to manage max_hw_heartbeat_ms too.



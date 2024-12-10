Return-Path: <linux-watchdog+bounces-2520-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [139.178.88.99])
	by mail.lfdr.de (Postfix) with ESMTPS id 42D4C9EB1B5
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 14:14:31 +0100 (CET)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 67AE8283866
	for <lists+linux-watchdog@lfdr.de>; Tue, 10 Dec 2024 13:14:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id D8ADA1A2846;
	Tue, 10 Dec 2024 13:14:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="HZPl7jk0"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lf1-f42.google.com (mail-lf1-f42.google.com [209.85.167.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1940919F12A;
	Tue, 10 Dec 2024 13:14:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733836459; cv=none; b=Ll/i5G1+GzIvvTK+kJ18EIySonAZaNAQf5gXoWucrIYy+g5tFUweEejiacoj9oLW54vW9s9GeDoHhpk3IaQgOKQ4HNpw2tBuid+wktXt2C51olgvlhRt15fFhOSSMts7UTkChOQji6mEDc977220JlEORWnyy9gnqPspnP9fBek=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733836459; c=relaxed/simple;
	bh=lXeTpCsFNPyXQjhR6NOh1cFZGD6b+AcYziKg1jr1714=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=Z4MFMs5JcFjsRUhcHYNpJDBgCO1hFIuUXhNHzjyLi0247V+03TfQGFgL2Qz56tvC4xrUogI247S2/rXVnTJBfpZgpWhZZH7sUFuz8oBhHszxPxGkDAX6oRjN0E8OoDh8l7RxRNcc2wbfsOeWuO6FWL5tFpIU22NL64rbH6k4wWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=HZPl7jk0; arc=none smtp.client-ip=209.85.167.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lf1-f42.google.com with SMTP id 2adb3069b0e04-53f757134cdso3001699e87.2;
        Tue, 10 Dec 2024 05:14:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1733836456; x=1734441256; darn=vger.kernel.org;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:from:to:cc:subject:date:message-id:reply-to;
        bh=R1Psbh7Pq+z4qmSLdi9TiYvyojYMlP7k/gDKwJ7aPII=;
        b=HZPl7jk0NG57dV+/dW4qwC3r71StITphuAPLCreP6hns2jsm9ia73Ip7lAvnXsY7W1
         atojPFGw+9TrI8yeGp0sRi4WLUG3oh+xva4Et3lSyl5e3RxxegHuTrp5qvSCn3dkwylv
         nWmN6U6MjZRWVfrU28OjSoeBgMaOAhmO0Mu9dVg7i90Elo5sXr0/V5NxJLzEoiajzU2F
         hplmm51bT5BoWeCEFYJSPNUji3nj6v0KU7XO3Dsz7+QVb7ip5oeeMe1FepriREWAnqYb
         3P5fUTFS1BBVJlb37Mj3FbzWz5NEqrGQ243S6vh/YgnF/6oTsoBSBUDj5VYRwPTsBOAb
         jBzg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1733836456; x=1734441256;
        h=cc:to:content-transfer-encoding:mime-version:message-id:date
         :subject:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=R1Psbh7Pq+z4qmSLdi9TiYvyojYMlP7k/gDKwJ7aPII=;
        b=QpysUpINJ+kiOwjYBrGZZ5Wu2obczSxFHUqiY+jDq4w/saT/oxrZeDTZOjWoFOsciy
         a9EPprHa1VT/pU+IvjzOuPBOJPMYlsWBTRT7NzXq490wk8IBjRHG7cb79w3jUaDRSkL6
         OITDMHP3yYsln1Vr6tInqHKSNonZ5+fqy6EGazbvjB+AiHg7o1QmogeVj1x+FtnEE/HO
         FnobVEWAoGou3E9JNPVNTMWyLSdVw5h6LmSGL1Buz/z87KTYwP1cfqK5gCTLLhcs6z+/
         pTNnP3peKd2+rl4sI1YnMls/zLZZ3D+5yb3LMS8VBg7dNFzk+JtvaVDOVTNRLy4cH3Dh
         fRQg==
X-Forwarded-Encrypted: i=1; AJvYcCUBvF/97P2hQbXhEbQ9y+yCiuynlHmrkr4O5AGoBetlKKdcgQjvfqap2Ho26gM5K47Cj4KsNKoDZ6ElFCs3og==@vger.kernel.org
X-Gm-Message-State: AOJu0Yym+y3bEYIgywesqhVnNWnLChi2gouEYp8MVv1C8hBLp0CtKBYO
	Bt6sQWp3aUnLFsPw1zZy3AKkG6loBGbAOkQHeK6Jr6Ea+FEotwam
X-Gm-Gg: ASbGncti/stPR265ROS33q7+gO4Pj2CUotI/ESwyjzOdzJ5pdAh9bdOGgCztOjCwcc5
	UrYfX+33nhCu5rMkQPMHN294GGm2OhCFEBMtLU2hjqfwXs95kqRx2z3ZsbyVoB2bdILIkw0+8KD
	zeb3eox2uEoKQFLqkhwh3vs0YS5vBMW+bLagaEjrAtc+MF7f6jOxdbyeeVV7895nUFT6+Jc8MPk
	R92ICCaInUXYt7C5ILlrNrQOJtVCTLEHhs3nQQ0G5h4EmrWy7rw0CjF9kziP5U1xPDTJ5BQx+19
	mCw1UUdSVt+IddxTMuQ=
X-Google-Smtp-Source: AGHT+IFOyC8sungLAW+4oANTSzK7oMlje9CM+XSQnUKOAiK4k+YXkmd84+1LyBQAeb5JABsGUoe/Tw==
X-Received: by 2002:a05:6512:128b:b0:53e:3a94:c2bc with SMTP id 2adb3069b0e04-53e3a94c305mr4366108e87.18.1733836455953;
        Tue, 10 Dec 2024 05:14:15 -0800 (PST)
Received: from [172.17.0.1] (83-233-6-197.cust.bredband2.com. [83.233.6.197])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-53ef5085b8csm1037589e87.3.2024.12.10.05.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Dec 2024 05:14:15 -0800 (PST)
From: Marcus Folkesson <marcus.folkesson@gmail.com>
Subject: [PATCH 0/2] DA9052 boot status
Date: Tue, 10 Dec 2024 14:13:47 +0100
Message-Id: <20241210-da9052-wdt-v1-0-d026e0158688@gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAIs+WGcC/6tWKk4tykwtVrJSqFYqSi3LLM7MzwNyDHUUlJIzE
 vPSU3UzU4B8JSMDIxNDI0MD3ZRESwNTI93ylBLdRHNLE+NEcxNTSwtzJaCGgqLUtMwKsGHRsbW
 1AA08E/hcAAAA
X-Change-ID: 20241210-da9052-wdt-a7943a745987
To: Support Opensource <support.opensource@diasemi.com>, 
 Lee Jones <lee@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org, 
 Marcus Folkesson <marcus.folkesson@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1263;
 i=marcus.folkesson@gmail.com; h=from:subject:message-id;
 bh=lXeTpCsFNPyXQjhR6NOh1cFZGD6b+AcYziKg1jr1714=;
 b=owEBbQKS/ZANAwAIAYiATm9ZXVIyAcsmYgBnWD6XNG5uJgzI13lRTcB7KsL6SvcFrzpsI7c9w
 5JpZOwQuBOJAjMEAAEIAB0WIQQFUaLotmy1TWTBLGWIgE5vWV1SMgUCZ1g+lwAKCRCIgE5vWV1S
 Mkz3D/9WkXm2dFKQiL2X4VavkcpZvdkAmpijnNHYHE31JEqcG5kL3DZ/fwVmpLHU2DcmDkiZpQ/
 q3J/pp1l0Qy4OYlS8zyI11JxUONDxZGZjOikTsJExbtrRSXkouNknPH1kU7J6Bjh7tM96vi4kaC
 Od06a8Jqh1Jq5lHisCfA4qSTHitNsb+xQ2gvemMoVy3nhD2yTj+NryYc/px3mLmo3cqlzndob19
 hKK1v/ws0etQYGV/7Etl5Fz51pm3gwZ+hHLcDGT2xNVN/6DWdd5Z9mJ6DFUIyWNYirz5OnTucSi
 HKRhxU2Duz36q2jXDsVMOUxOLVJkuEUPDfa3iB8upTgu36QbfnB8Tw8aF7gdoPmoYgSDrFuGL1R
 6s/6TeKdh1EDG1XKCQInAMBOhsRpjaAGdk5OLAZquWiCSBQ/D3QesGAlHH1lv3kh3Nfo4Vx6U/F
 Xshb9SCmA+5W1jr/jcwZEHCVT3aQkapxeYuiSrFecmdwhgYG3XdMu3dirZXvvIECr6xHCxHIFTK
 NrYVcHJKzFLjSZr3HjvliyJCxr0mx7lBHqautyItOGMWc34EgxSZKOH9zhvkIUEjunBRc982tOn
 oRvu86/Tj/RP59BYxXXaEa1Q+m2esK7cFh+6sLtriKJOmeAFv/xvjSGnSFmX4UhoefTJPy/MX6X
 dTxok5YyHHgicXA==
X-Developer-Key: i=marcus.folkesson@gmail.com; a=openpgp;
 fpr=AB91D46C7E0F6E6FB2AB640EC0FE25D598F6C127

Make it possible to read out the boot status from the da9052-wdt driver.

Function verified with `wdctl`.

root@mfoc:~# wdctl  /dev/watchdog1
Device:        /dev/watchdog1
Identity:      DA9052 Watchdog [version 0]
Timeout:        4 seconds
Pre-timeout:    0 seconds
FLAG           DESCRIPTION                   STATUS BOOT-STATUS
CARDRESET      Card previously reset the CPU      1           1
KEEPALIVEPING  Keep alive ping reply              1           0
OVERHEAT       Reset due to CPU overheat          0           0
POWERUNDER     Power bad/power fault              0           0
SETTIMEOUT     Set timeout (in seconds)           0           0

Signed-off-by: Marcus Folkesson <marcus.folkesson@gmail.com>
---
Marcus Folkesson (2):
      mfd: da9052: store result from fault_log
      watchdog: da9052_wdt: add support for bootstatus bits

 drivers/mfd/da9052-core.c         | 26 +++++++++++++-------------
 drivers/watchdog/da9052_wdt.c     | 13 ++++++++++++-
 include/linux/mfd/da9052/da9052.h |  2 ++
 3 files changed, 27 insertions(+), 14 deletions(-)
---
base-commit: cdd30ebb1b9f36159d66f088b61aee264e649d7a
change-id: 20241210-da9052-wdt-a7943a745987

Best regards,
-- 
Marcus Folkesson <marcus.folkesson@gmail.com>



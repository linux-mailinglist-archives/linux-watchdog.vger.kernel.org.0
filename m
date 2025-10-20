Return-Path: <linux-watchdog+bounces-4405-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id 70B69BF28CE
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 18:54:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id CF05E4EFB50
	for <lists+linux-watchdog@lfdr.de>; Mon, 20 Oct 2025 16:53:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 8F2F0330D2E;
	Mon, 20 Oct 2025 16:52:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="ZLmolHsW"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-wm1-f41.google.com (mail-wm1-f41.google.com [209.85.128.41])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DC29330332
	for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 16:52:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.41
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760979156; cv=none; b=S7JSeyhT6n3ANPq5iFvtCIaaTZBK2FMTT39cfsew3jnQ2qrX2f2h3g8HFiPYya8nDI82F+roKVZ7XiBJk+UuSqBhFXwfDfwhQokXT7lD4sJAx3gvyAMeSyMKuHMn4Ugcf4pRyU4rL87f51qgnOjF4sZOxb6wKYz0CVm9pAfpvbU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760979156; c=relaxed/simple;
	bh=htAlHwQVIYizuRXKdH6PchWyf3kZMookjeX2Sgrd4xk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KXpXCBSHyFehIaEmxVB5asTqlXEfpFlsIjRPmPrCM/ppIykhMQrUMHnohJ7Glfzv8juFJLrqDkvafhQI1DqksMf3+GYC/mCJD07w/o2orzrToMp05xlXDO45P4Do0KX93gqG0pbOH30d1EWRS8aGAsh6k4B1WseoI3LuB9squHY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=ZLmolHsW; arc=none smtp.client-ip=209.85.128.41
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Received: by mail-wm1-f41.google.com with SMTP id 5b1f17b1804b1-470ff9b5820so7384845e9.3
        for <linux-watchdog@vger.kernel.org>; Mon, 20 Oct 2025 09:52:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1760979153; x=1761583953; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9s2zBGFC8HC7HhNDa+xm1kX5bnSLiqdr+y/FIgBtsxQ=;
        b=ZLmolHsWXsLJwuH41+/+Zm+e2G5rKhJJgGMLKl3MmUanjPWgRnjRY/X3snakIWVXDo
         fcuSsw3Io+4G0ezUGBkZn3e1s9z+GaaEPuDeonxZ74oPMadiJa6xiG0Vf+JFhtHaLgab
         hX8+tKmUSNZs28yuTv6s9hCxEe7mmSn76QyD7YLKaQFO6Aco3Fu7fz5nMUCQ3FW7L79I
         QIm04ZPTwKZUvguRG/2VFdcjIcpDknMWfv0Og3WisdGhQXORGIY1483S/KcqHq8ZWWnU
         tU5RHIpJTfnxHB2Gw+3FB0R0HC+azjp2XRU/YvHDbheXTUfQvcViGKcFfP5YIlvnI4MK
         EYvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760979153; x=1761583953;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9s2zBGFC8HC7HhNDa+xm1kX5bnSLiqdr+y/FIgBtsxQ=;
        b=b2KnASgaxNhCiB/IJsDaOthYemwX9W6B1KQakdqRVJMJrtHTL7E5sdO/4vR4FwomgA
         0rMZFMPQHs8CBO1ecLlPsoKlF0jjZ9b4amU0WSLwv4ZnS9p025WGkvZQgXxSo/z2Zss4
         QPp1D++byhzMTFTqD6alrRnFuOeoS6iO7Qw9Z3xxJMIFvodAGXX9bRuU5Ii8BOqWwEDe
         3eER4jOqcxyFRBI+tjgk1MrmlgFYJt6jVDhIFzVewyvuHUxwem521d57OvOJKaj0joXv
         tO1riYGSWYRbdRijNPoqtSO8LS4DFA0U0n32tyfZvzZ5c2sx4qWAoMvOhi4mFsCBNBXG
         7SmQ==
X-Gm-Message-State: AOJu0YyH/z9uFAtLjqrNSr1ToP33vOR9Ir3L89ZNln21hgkAtEoWIOF3
	XcqNypxlBziFiBJ+X4WFjrEzUMKIzpqKEhRwknUvykUX54gZLxsIuXMc1z8sl2gC3BU=
X-Gm-Gg: ASbGncunB9GETQdxMBURJ2u3xJKmd7eIGQaPob67O6KoZDhT8fYKsZ5M+Z/7VOZLN58
	1FfnaSDtcVYK0w989joJNI0xHK4F6fP1qiCx4WDED6+Oo1IQdQYK2A4TcYtCYW72pVqKQfjSjt6
	Q8qQEGmXrnqjBclPWTzOKH3AgEFdwFJulMfvmkUKJFlEyDbmTsVuCUdmzFzMCZFbdM0XUJ3z0Zr
	bT5SlPVEwxBTtgZRsw79FuDeESW9T3y7O5Zhkf735NIjlgIqd0mvzV/e574PBVRUjJtumHQFz8K
	Hm6+XQcUP5MKUdgOJMZWRhrskVCWtmmet3wl/x95ayRPx16COzLcJ76dQFbyxhq8kq1cAAWOau+
	qvchC4txRRgsR7gd9odd87F/6TY67odPFsZ/yiR9xil3LQDq3nFQF4CWGu1j+SScQbrMtysSO5p
	dg1jxcavIIdFmeeXURmgJSLbnURNc=
X-Google-Smtp-Source: AGHT+IHG9a3/3M25m7Es4vnxCmLCJx69A8ax6XoFZlXJBUz+MkJq5yGxtpLLdLEf4IZ4Zi6XBHqZFQ==
X-Received: by 2002:a05:600c:3b04:b0:471:12be:744 with SMTP id 5b1f17b1804b1-47117932dd5mr55329145e9.8.1760979152937;
        Mon, 20 Oct 2025 09:52:32 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.219.123])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-471144c82c9sm238324695e9.14.2025.10.20.09.52.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 09:52:32 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Mon, 20 Oct 2025 18:52:21 +0200
Subject: [PATCH 2/3] dt-bindings: watchdog: Allow node names named 'pmic'
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-dt-bindings-watchdog-timeout-v1-2-d0f3235eb327@linaro.org>
References: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
In-Reply-To: <20251020-dt-bindings-watchdog-timeout-v1-0-d0f3235eb327@linaro.org>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Lee Jones <lee@kernel.org>, 
 Matti Vaittinen <mazziesaccount@gmail.com>
Cc: linux-watchdog@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, 
 Timothy Pearson <tpearson@raptorengineering.com>, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=975;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=htAlHwQVIYizuRXKdH6PchWyf3kZMookjeX2Sgrd4xk=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBo9mjKWkCODiSTKVC6hNwgzQPe7coHBherhOW57
 0KJ/VKGemeJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCaPZoygAKCRDBN2bmhouD
 16bBD/9e7PiFf8JEVvATyMQtFP3rL6Z8LpZpTQS2yu7d+wi9snlR/LzTCz8tGPMCbPNZZQKYGUc
 upB0lCvkB7lK6YXiJkTuHC6c0lZIWi3cNlG1EEkLUTBMHLJzfPlu7W7dxfLbV+cd0Yxh3jQrDMl
 unTPMzc+P7h4GBmqh3tLjg6n/qwmKE4poh0kAGqfDpmNpR3nrlWJsjwC4kRUbJ6droZ9/HJudN1
 OR3UQtcIU9EsKmYQVD+YpuRX+g9+obMRXL616UcNow0C0bFi79TUVaRJRFFD+m83odDthX1lRo8
 CL+4V1K+B1qtDcvQBmAWfPMiHprjXcpU74OHhwzNflVBh2IW38dA9MLzioVVIlmE6EMBKlBiUEW
 KeGZIkwHkByhcfzYaG48TyasyqxaQvUEfCHRDiLxtHgdxbegno9Ci7G66pY9/P1d/rIPH/z0qvI
 A92Yov3qavMU9kcAPKBWAxObC2S1AHSRHylnDr9FK0QHaAxrljD612UGZ/yLxYlseMzU7QCH5Pi
 7tJLFeEUUZEL8L3VHfhzzJmohvTjFZTOXbZFHlvO3i+AjXF2WWIyb0tcQi0aVZzKd+/5W13yK/a
 66Hu87O0Q1X5E0K5dxze7VBshMQmeqjE2MGssHMb4wfOAuUGnjAdB4Ype+1t/f7lbRxmAylWDao
 GAU7cUOKliGSZWA==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Watchdog is often part of more complex devices like Power Management ICs
(PMIC), e.g. on rohm,bd96801, and the schema can be referenced by a
binding describing parent (main) node.  Allow another typical name for
such PMIC devices: pmic.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 Documentation/devicetree/bindings/watchdog/watchdog.yaml | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/devicetree/bindings/watchdog/watchdog.yaml b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
index be0327f587eb..77ac23516d6d 100644
--- a/Documentation/devicetree/bindings/watchdog/watchdog.yaml
+++ b/Documentation/devicetree/bindings/watchdog/watchdog.yaml
@@ -21,7 +21,7 @@ select:
 
 properties:
   $nodename:
-    pattern: "^(timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$"
+    pattern: "^(pmic|timer|watchdog)(@.*|-([0-9]|[1-9][0-9]+))?$"
 
   timeout-sec:
     maxItems: 1

-- 
2.48.1



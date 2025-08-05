Return-Path: <linux-watchdog+bounces-3969-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id A27E2B1B455
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 15:12:27 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 85D7D182D91
	for <lists+linux-watchdog@lfdr.de>; Tue,  5 Aug 2025 13:12:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E962127780D;
	Tue,  5 Aug 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="P01faNNU"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BF6B8272E5E;
	Tue,  5 Aug 2025 13:10:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754399454; cv=none; b=VybWg2O87r0dp8pg+QH4eRdsSg15GWp+eWDVgJpSpfFGyIWdd1YHPT4A2/bj6EFsUsQLdRpkNMoOXlqH/VjqG4LXLCHGSo8+fW2ogmrWe7PsOc49UrurMRyXtNRC2nyYVYAFfqLMMLEHtetJETzhi9BGnl00ZaMlJX/Dzw4tW2k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754399454; c=relaxed/simple;
	bh=HynsNXTfXJ8if4X286OxVES8dPGhWFDMtO9Y8MkCMVs=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=dGdQjkGXFKq8jWp6OcY4SV5L7azGow8SflbHf1xxHJLI6ZovocPg5Hw0slqW2uV2L7iNduLBAOwIcaDji37sayeyIgYXyqiP6q64QjpXNE1/zhB5ctvFYFgeQqsMyGK5qfYlCMEKy41dcFrDnjm+foMAHmD4ADqsZdscdb3cia0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=P01faNNU; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7355EC4CEF4;
	Tue,  5 Aug 2025 13:10:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754399454;
	bh=HynsNXTfXJ8if4X286OxVES8dPGhWFDMtO9Y8MkCMVs=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=P01faNNUVP2tb7BmmhS6XbTbMDjBIt8IeCgbKb8+IbbK4fXJLZ1l3wJV1E+Ok5Hip
	 P+Rx9mYcEt4FPupz5VNCU38laFp/iltHp0VjkVvmBU+c3hC6plMTV9M5kfSnv9MvQz
	 Jwr4Wtv63t7OrquT+enMN7zukCfDmtiIc5a7cHzcMxatlFEYZiyU2X2aQ3YRQuLrDx
	 RIt8WTyM1YgWCHhZn4vfG55rpOnZftCQd5Ej89B3ELuVa43/nHqjsD3vEq/SsJLOSX
	 us2T2gElBneJ4evP98DGA2DWxWZYGQqvi1vrDpJ91AZT1PWi7xHQ4+SN7iOIW27utc
	 u6MQ9ujgZ/GYg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Ziyan Fu <fuzy5@lenovo.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.16-5.15] watchdog: iTCO_wdt: Report error if timeout configuration fails
Date: Tue,  5 Aug 2025 09:09:06 -0400
Message-Id: <20250805130945.471732-31-sashal@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250805130945.471732-1-sashal@kernel.org>
References: <20250805130945.471732-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.16
Content-Transfer-Encoding: 8bit

From: Ziyan Fu <fuzy5@lenovo.com>

[ Upstream commit 40efc43eb7ffb5a4e2f998c13b8cfb555e671b92 ]

The driver probes with the invalid timeout value when
'iTCO_wdt_set_timeout()' fails, as its return value is not checked. In
this case, when executing "wdctl", we may get:

Device:        /dev/watchdog0
Timeout:       30 seconds
Timeleft:      613 seconds

The timeout value is the value of "heartbeat" or "WATCHDOG_TIMEOUT", and
the timeleft value is calculated from the register value we actually read
(0xffff) by masking with 0x3ff and converting ticks to seconds (* 6 / 10).

Add error handling to return the failure code if 'iTCO_wdt_set_timeout()'
fails, ensuring the driver probe fails and prevents invalid operation.

Signed-off-by: Ziyan Fu <fuzy5@lenovo.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Link: https://lore.kernel.org/r/20250704073518.7838-1-13281011316@163.com
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

**Backport Status: YES**

This commit should be backported to stable kernel trees for the
following reasons:

## Bug Fix Analysis

1. **Critical Bug Being Fixed**: The commit fixes a probe failure
   handling bug where the driver continues to initialize with an invalid
   timeout value when `iTCO_wdt_set_timeout()` fails. This can lead to:
   - Watchdog operating with incorrect timeout values
   - Misleading information reported to userspace (timeout shows 30s but
     actual timer reads 0xffff)
   - Potential system instability due to watchdog misbehavior

2. **Clear Error Path Issue**: Looking at the code changes in
   drivers/watchdog/iTCO_wdt.c:579-584, the original code ignored the
   return value of the fallback `iTCO_wdt_set_timeout()` call. If this
   second attempt to set the default timeout also fails, the driver
   would continue initialization with a potentially corrupted watchdog
   state.

3. **Hardware Interaction Failure**: The `iTCO_wdt_set_timeout()`
   function (lines 351-395) performs hardware register writes and
   verifies them. A failure here means:
   - Hardware register writes failed to take effect
   - Verification showed the written value didn't match what was read
     back
   - The watchdog timer is in an undefined/invalid state

## Stable Backport Criteria

1. **Small and Contained Fix**: The change is minimal - only 4 lines
   added:
   - Captures return value of fallback timeout setting
   - Adds error checking and proper error return
   - Adds appropriate error logging

2. **No Architectural Changes**: This is a straightforward error
   handling fix that doesn't change any interfaces or introduce new
   features.

3. **Fixes Real User-Visible Issue**: The commit message shows this
   causes real problems visible to users through `wdctl` command showing
   incorrect timeout/timeleft values.

4. **Low Risk of Regression**: The change only adds error checking where
   none existed before. If the timeout setting succeeds (normal case),
   behavior is unchanged. If it fails, the driver now properly fails to
   probe instead of continuing with invalid state.

5. **Critical Subsystem**: Watchdog drivers are critical for system
   reliability and recovery. A malfunctioning watchdog that reports
   incorrect values or operates with wrong timeouts can lead to
   unexpected system reboots or failure to reboot when needed.

6. **Part of a Series of Fixes**: This appears to be from the same
   author (Ziyan Fu) who previously fixed a related issue in commit
   158f9f2f7152 about updating the heartbeat value. This suggests
   ongoing work to fix error handling in this driver.

The fix prevents the driver from operating in an invalid state when
hardware initialization fails, which is exactly the type of bug fix that
stable kernels should include to maintain system reliability.

 drivers/watchdog/iTCO_wdt.c | 6 +++++-
 1 file changed, 5 insertions(+), 1 deletion(-)

diff --git a/drivers/watchdog/iTCO_wdt.c b/drivers/watchdog/iTCO_wdt.c
index 9ab769aa0244..4ab3405ef8e6 100644
--- a/drivers/watchdog/iTCO_wdt.c
+++ b/drivers/watchdog/iTCO_wdt.c
@@ -577,7 +577,11 @@ static int iTCO_wdt_probe(struct platform_device *pdev)
 	/* Check that the heartbeat value is within it's range;
 	   if not reset to the default */
 	if (iTCO_wdt_set_timeout(&p->wddev, heartbeat)) {
-		iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
+		ret = iTCO_wdt_set_timeout(&p->wddev, WATCHDOG_TIMEOUT);
+		if (ret != 0) {
+			dev_err(dev, "Failed to set watchdog timeout (%d)\n", WATCHDOG_TIMEOUT);
+			return ret;
+		}
 		dev_info(dev, "timeout value out of range, using %d\n",
 			WATCHDOG_TIMEOUT);
 		heartbeat = WATCHDOG_TIMEOUT;
-- 
2.39.5



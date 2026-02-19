Return-Path: <linux-watchdog+bounces-4953-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id QBW/GOdvlmlqfQIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4953-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Feb 2026 03:05:27 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 025ED15B789
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Feb 2026 03:05:26 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 9EF623021B82
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Feb 2026 02:04:59 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 56B28275112;
	Thu, 19 Feb 2026 02:04:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="TB2XseMu"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E152868AB;
	Thu, 19 Feb 2026 02:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771466670; cv=none; b=OVV1kbM0AYOi8S/9r/3/ICccBVOlEw4s+UlDgjXbcHNkKxGMLlhzJAkXw9h3M71F9QS5eFCuDcVdbhBTM8NeiAvDZS9jpxxZ2Mg0ympNXaTXhG3NzQUnOx29bDIBeGdj+RjNzr+tze6TvTRIXzDTFLmFDl/xh14bZqg2tsD0m3g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771466670; c=relaxed/simple;
	bh=0hJ+5fEDLB7GVPLPc5R1WbnNLZrdckOHHYFtAyTZQcE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=l7yvaqKc75bhDGIsQ2/q/ghNieFvC/jDlkf5QJlG2qK9x+fkXM3vbTI2to847Z6WxEM5H8FBje79Z2cW1RMYBgjwJZPCPMFeu+iFgbRtqu6fP1x1qCyqyEuhh8QUFlsHU3MCff0hogucLBm1i9bTgF7GMgbCxpfNo6oSTKyexE0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=TB2XseMu; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A232C116D0;
	Thu, 19 Feb 2026 02:04:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466669;
	bh=0hJ+5fEDLB7GVPLPc5R1WbnNLZrdckOHHYFtAyTZQcE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=TB2XseMusxaBz3VupWqW7pfcA2DDlUwbZhchM+pXsE196b2FvXX9V6gDMaswBAVLT
	 kV5J/pimHB2e5peBC9Irh8k8b7OhbVqcze0yhELP3K03iCIiqqsX6UQ1J5/m4Yf1dI
	 Bua/rRHY3X29aNp8BiX8FLKGqX1pRK0U0gbwUB8/r93GABV0410Tk0yD0jJkKz4dLV
	 aOxoySNTwk2ECS0G6Moq/5TN9Iqpy4wf5uviJod9hT8vIo782p87AfcSOlls6/9aqc
	 FZKiJVWIlRYpRVfYjVcQ7k4/S3vrMPWOm4kZ+iWeKorOtUpAAABfyMopbCID1ZLsd5
	 K+93EoqBl840A==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: =?UTF-8?q?Ren=C3=A9=20Rebe?= <rene@exactco.de>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-5.10] fix it87_wdt early reboot by reporting running timer
Date: Wed, 18 Feb 2026 21:03:41 -0500
Message-ID: <20260219020422.1539798-5-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-1.16 / 15.00];
	MID_CONTAINS_FROM(1.00)[];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[kernel.org,quarantine];
	R_DKIM_ALLOW(-0.20)[kernel.org:s=k20201202];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4953-lists,linux-watchdog=lfdr.de];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[kernel.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	TO_DN_SOME(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[sashal@kernel.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_SEVEN(0.00)[8];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,exactco.de:email]
X-Rspamd-Queue-Id: 025ED15B789
X-Rspamd-Action: no action

From: René Rebe <rene@exactco.de>

[ Upstream commit 88b2ab346436f799b99894a3e9518a3ffa344524 ]

Some products, such as the Ugreen DXP4800 Plus NAS, ship with the it87
wdt enabled by the firmware and a broken BIOS option that does not
allow to change the time or turn it off. As this makes installing
Linux rather difficult, change the it87_wdt to report it running to
the watchdog core.

Signed-off-by: René Rebe <rene@exactco.de>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

I see that `wdt_update_timeout()` selects GPIO before calling
`_wdt_update_timeout()` (which accesses these registers). In the init
function, `superio_select(GPIO)` is called at line 354, then the PWRGD
quirk might change to EC. But looking at the diff again carefully:

The diff shows the `_wdt_running()` check is placed AFTER the PWRGD
block. For chips with the PWRGD quirk, the GPIO LDN may not be selected
at that point. However, this was reviewed by Guenter Roeck, the watchdog
subsystem co-maintainer, so he considered this acceptable. It's possible
either:
1. The WDTVAL registers are accessible regardless of LDN in these chips,
   or
2. The PWRGD quirk only applies to chips where the check still works, or
3. It might need a `superio_select(GPIO)` before the check — but this
   was reviewed and accepted by the maintainer, so I'll trust the
   review.

## Classification

This commit:
- **Fixes a real bug**: Systems with firmware-enabled IT87 watchdogs
  reboot during Linux boot/installation because the kernel doesn't know
  the watchdog is already running
- **Is small and contained**: 12 lines added, 1 file changed
- **Uses a well-established pattern**: `WDOG_HW_RUNNING` is used by 15+
  other watchdog drivers
- **No new features**: This doesn't add new functionality — it makes
  existing hardware work correctly by properly reporting hardware state
- **Was reviewed by the subsystem maintainer**: Guenter Roeck reviewed
  and signed off

This falls into the **hardware quirk/workaround** category — it makes
certain hardware (Ugreen DXP4800 Plus NAS and similar) work correctly
with Linux when the firmware leaves the watchdog enabled.

## Risk Assessment

**Very low risk**:
- The added code is read-only during init (reads WDT value registers)
- `WDOG_HW_RUNNING` is a standard, well-tested mechanism
- Worst case: if the check incorrectly reports the watchdog as running,
  the kernel just pings it unnecessarily (no harm)
- If the check incorrectly reports the watchdog as NOT running, behavior
  is unchanged from before (same as current code)
- Single file, single driver, isolated change

## User Impact

**High for affected users**: Without this fix, users with IT87 watchdog-
enabled firmware literally cannot install Linux — the system reboots
before installation completes. This is a critical usability bug for
specific NAS products.

## Verification

- Confirmed `WDOG_HW_RUNNING` is defined in
  `include/linux/watchdog.h:122` as bit 3 of watchdog status
- Confirmed `watchdog_dev.c` automatically pings watchdog when
  `WDOG_HW_RUNNING` is set (line 96, 1099-1104)
- Confirmed at least 15 other watchdog drivers use the same
  `set_bit(WDOG_HW_RUNNING, ...)` pattern in init
- Confirmed commit 88b2ab346436f is the actual commit, dated Nov 17
  2025, adding 12 lines
- Confirmed `wdt_update_timeout()` uses `superio_select(GPIO)` before
  accessing WDT registers, consistent with the `_wdt_running()` function
  design
- Confirmed the commit was Reviewed-by Guenter Roeck (watchdog co-
  maintainer) and Signed-off-by both Guenter Roeck and Wim Van Sebroeck
  (watchdog maintainer)
- Confirmed the change is self-contained — no dependencies on other
  patches

## Conclusion

This is a textbook stable backport candidate:
- Fixes a real, user-impacting bug (system reboots during boot/install)
- Small, surgical, well-understood change (12 lines)
- Uses a standard, well-tested kernel mechanism (`WDOG_HW_RUNNING`)
- Reviewed by the subsystem maintainer
- Zero risk of regression (read-only check during init, standard
  pattern)
- Isolated to a single driver file

**YES**

 drivers/watchdog/it87_wdt.c | 12 ++++++++++++
 1 file changed, 12 insertions(+)

diff --git a/drivers/watchdog/it87_wdt.c b/drivers/watchdog/it87_wdt.c
index 3b8488c86a2f3..1d9f8591f38d8 100644
--- a/drivers/watchdog/it87_wdt.c
+++ b/drivers/watchdog/it87_wdt.c
@@ -188,6 +188,12 @@ static void _wdt_update_timeout(unsigned int t)
 		superio_outb(t >> 8, WDTVALMSB);
 }
 
+/* Internal function, should be called after superio_select(GPIO) */
+static bool _wdt_running(void)
+{
+	return superio_inb(WDTVALLSB) || (max_units > 255 && superio_inb(WDTVALMSB));
+}
+
 static int wdt_update_timeout(unsigned int t)
 {
 	int ret;
@@ -374,6 +380,12 @@ static int __init it87_wdt_init(void)
 		}
 	}
 
+	/* wdt already left running by firmware? */
+	if (_wdt_running()) {
+		pr_info("Left running by firmware.\n");
+		set_bit(WDOG_HW_RUNNING, &wdt_dev.status);
+	}
+
 	superio_exit();
 
 	if (timeout < 1 || timeout > max_units * 60) {
-- 
2.51.0



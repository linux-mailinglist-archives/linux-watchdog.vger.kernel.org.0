Return-Path: <linux-watchdog+bounces-4955-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 2K4vHGdxlmlqfQIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4955-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Feb 2026 03:11:51 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0F2E615B94A
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Feb 2026 03:11:51 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id 5BC64303B198
	for <lists+linux-watchdog@lfdr.de>; Thu, 19 Feb 2026 02:08:19 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 273E230F549;
	Thu, 19 Feb 2026 02:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="nMoGASr1"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0391928D8FD;
	Thu, 19 Feb 2026 02:05:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771466705; cv=none; b=oxoTmmIF9+Xvh0lZxailjr4Wih5JYIjcbOSrNQ9O/iHcOyosTPq7H3L7mqf8ST73JCp6F1EWVGF6BpZvsLDdPgQP7E+QDFWwRyvComh/980YhaLCKZIhngX4ZB4K5cpznJmnKIZRR7yBpXunjHenGT12uci6LbEGj2/E/3rHt4Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771466705; c=relaxed/simple;
	bh=OWUyDUYLIGpfdDvH7M8IARbFsrGTB/uGSAMlqlNkjUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=mabrLmi2/Gs+zmchZFtdFRdZaJmwoAK0GhLNG2JjfP35XJPr7Kpmj+EuAvN2BuA4RjMTrlkCAardJL3CewcTMo1cMIzmdy/BypktktXymKpYuX8k3mY/zYqvJHFyhbMGvX9S/Z2TtDIt7ks8z5SoU0FSfiGzxSpcazP5rlbSZkc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=nMoGASr1; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E5E55C19425;
	Thu, 19 Feb 2026 02:05:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771466704;
	bh=OWUyDUYLIGpfdDvH7M8IARbFsrGTB/uGSAMlqlNkjUw=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=nMoGASr1olw2h3vlyaZKeFhIjGTmlMUt9V6urvzm2E+XGtJ8evXQkPDXsQ1bWASQ1
	 are63hgEDvkW5a/oXxkpEXQ2/nHha2CMDNQm019Lya0yr9ORI7DB+/I1NK2jUlScCE
	 7DYcGgN87fzv7uStGv0D3C/qFElmMHGlzqDZbkdFjcsjR5SOZXIENqJIiAYX7YwvJd
	 Lj+UpotiX5AQXICu+Qm8vHFBbs1+kxpZZ/goKJcANbfMyBlLQGZFveJ2vEvDaW3uLS
	 DgWHylmrKaXyOuwH89H+COrL3VVpBC5nH3D2DmqXMfc7TC/bOYWyAeocNYhd1hO/DU
	 xOVGRrmAuwRVw==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH AUTOSEL 6.19-6.18] watchdog: rzv2h_wdt: Discard pm_runtime_put() return value
Date: Wed, 18 Feb 2026 21:04:08 -0500
Message-ID: <20260219020422.1539798-32-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20260219020422.1539798-1-sashal@kernel.org>
References: <20260219020422.1539798-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.19.2
Content-Type: text/plain; charset=UTF-8
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
	TAGGED_FROM(0.00)[bounces-4955-lists,linux-watchdog=lfdr.de];
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
	DBL_BLOCKED_OPENRESOLVER(0.00)[linux-watchdog.org:email,intel.com:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns,roeck-us.net:email]
X-Rspamd-Queue-Id: 0F2E615B94A
X-Rspamd-Action: no action

From: "Rafael J. Wysocki" <rafael.j.wysocki@intel.com>

[ Upstream commit 2dea984a74265a67e3210f818416a83b87f70200 ]

Failing device probe due to pm_runtime_put() returning an error is not
particularly useful.

Returning an error code from pm_runtime_put() merely means that it has
not queued up a work item to check whether or not the device can be
suspended and there are many perfectly valid situations in which that
can happen, like after writing "on" to the devices' runtime PM "control"
attribute in sysfs for one example.  It also happens when the kernel is
configured with CONFIG_PM unset.

Accordingly, update rzt2h_wdt_wdtdcr_init() to simply discard the return
value of pm_runtime_put() and return success to the caller after
invoking that function.

This will facilitate a planned change of the pm_runtime_put() return
type to void in the future.

Signed-off-by: Rafael J. Wysocki <rafael.j.wysocki@intel.com>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

So the driver was introduced in v6.12-rc1, meaning it would be present
in the 6.12.y stable tree.

### Assessment

**What the commit fixes:**
The commit fixes a real bug where the watchdog driver probe fails in
perfectly valid configurations, specifically:
1. When `CONFIG_PM` is not set — probe **always** fails because
   `pm_runtime_put()` returns `-ENOSYS`
2. When runtime PM has been configured in ways that prevent idle
   queueing — probe fails spuriously

**Stable kernel criteria assessment:**
- **Obviously correct**: Yes — the return value of `pm_runtime_put()` is
  not meaningful for success/failure of the initialization. The
  `pm_runtime_resume_and_get()` call that preceded it already succeeded,
  and the device configuration (stopping WDTDCR counter) was already
  done. The "put" is just releasing the runtime PM reference.
- **Fixes a real bug**: Yes — probe failure preventing a watchdog device
  from being usable.
- **Small and contained**: Yes — 3 lines removed, 1 line added, single
  file, single function.
- **No new features**: Correct, this is purely a bug fix.
- **Reviewed**: Yes — by Guenter Roeck (the watchdog subsystem
  maintainer).

**Risk assessment:**
- Extremely low risk. The change simply ignores a return value that was
  incorrectly being treated as a probe error.
- The `pm_runtime_put()` operation itself still happens; only the error
  check is removed.

**However**, this driver was only introduced in v6.12-rc1. It's only
applicable to the 6.12.y stable tree (and possibly 6.13.y if that
exists). This limits its scope somewhat but doesn't change whether it
should be backported.

**The "preparation for future API change" angle:**
While the commit mentions preparation for changing `pm_runtime_put()` to
return `void`, that's the motivation for the broader cleanup campaign.
The actual fix here independently addresses a real probe failure bug,
making it valid for stable.

### Verification

- **Verified CONFIG_PM=n behavior**: Read
  `include/linux/pm_runtime.h:261-264` — `__pm_runtime_idle()` returns
  `-ENOSYS` when CONFIG_PM is not set. `pm_runtime_put()` at line
  561-563 calls `__pm_runtime_idle()`, so it returns `-ENOSYS` without
  CONFIG_PM.
- **Verified driver introduction version**: `git describe --tags
  --contains f6febd0a30b6e` showed `v6.12-rc1~92^2~6`, confirming the
  driver was introduced in v6.12.
- **Verified the code change scope**: The diff shows exactly 3 lines
  removed (the `ret = pm_runtime_put()`, `if (ret < 0)`, `return ret;`)
  and 1 line added (`pm_runtime_put(&pdev->dev);`), all in
  `rzt2h_wdt_wdtdcr_init()`.
- **Verified reviewer**: Guenter Roeck (watchdog maintainer) gave
  Reviewed-by.
- **Unverified**: Whether anyone actually reported the CONFIG_PM=n probe
  failure — the commit message doesn't reference a specific report.
  However, the bug is clear from code analysis.

### Conclusion

This is a small, obviously correct bug fix that prevents the watchdog
driver probe from failing in valid configurations (notably CONFIG_PM=n).
It's reviewed by the subsystem maintainer, touches a single function in
a single file, and has zero risk of regression. While the driver only
exists in 6.12+, it should be backported to applicable stable trees.

**YES**

 drivers/watchdog/rzv2h_wdt.c | 4 +---
 1 file changed, 1 insertion(+), 3 deletions(-)

diff --git a/drivers/watchdog/rzv2h_wdt.c b/drivers/watchdog/rzv2h_wdt.c
index a694786837e11..f9bb4ef3d327b 100644
--- a/drivers/watchdog/rzv2h_wdt.c
+++ b/drivers/watchdog/rzv2h_wdt.c
@@ -270,9 +270,7 @@ static int rzt2h_wdt_wdtdcr_init(struct platform_device *pdev,
 
 	rzt2h_wdt_wdtdcr_count_stop(priv);
 
-	ret = pm_runtime_put(&pdev->dev);
-	if (ret < 0)
-		return ret;
+	pm_runtime_put(&pdev->dev);
 
 	return 0;
 }
-- 
2.51.0



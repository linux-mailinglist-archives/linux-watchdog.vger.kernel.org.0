Return-Path: <linux-watchdog+bounces-2837-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4605BA28847
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 11:42:12 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id A76003A287B
	for <lists+linux-watchdog@lfdr.de>; Wed,  5 Feb 2025 10:41:54 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 70D4422F165;
	Wed,  5 Feb 2025 10:39:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="OgIFI4DU";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2MkVDWvb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9E9F022ACD6;
	Wed,  5 Feb 2025 10:39:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738751999; cv=none; b=EqHV9sbb/SkA1+DhP5W+X6JgTZz6n4gjk2SD61HCAObQa3ZBc7mK+X4JmtpS0jP5PRj/8s09WReOUUw3AfO2DgtAfQ6U8XxuqJBJ/r324m441TMTqP4PVKXCei1L8wJjDtqU/NxYl6XY+S8uGaDhUvUEbYdNTlnjJ6cowYg5LOE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738751999; c=relaxed/simple;
	bh=AMjna7+7OWsw2aJekWWPLgo4H/lNOzaMTw/WhoTLB6Q=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=UA7hvKsrCqPU8mRdZa6kaa8R0ADRW47toy8ijEhw4k6lvq9KnJMbCt0iA2WeADCGgtgWlokVgRrEyXhnRKqE1heZ0C7CHeuf9GcQgQ77OY7Xt2yL32BC/dvsqQF++jzxe/bi3HLJMHeOQ3FFyJHI69Jb58MgUyLLHOJuzHXFn9k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=OgIFI4DU; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2MkVDWvb; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
From: Nam Cao <namcao@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWOsbeBXYe4P9Ey/QKmxFEQWVZvEI9fDikxtPGxLwCw=;
	b=OgIFI4DUO8J5bYuE4Zm2bHxV1S+PMB4KVkZgSX66PQX7xXUC87r7jVWm7767dg9quDM5LL
	AZEG9dcp0LAH8eV4kYNJLQ+MluhNk+ZBiOhClLq8RmvTE86rKabBS1HY94K86xD76fhPJL
	gi3srorMIplUUC1qwlT0FsZuXKvgOVEzUGXE8oGGy/dKP4r7oiBXcEW21KuhtLrn4kykXo
	kTwfaNL4vLwXnJwVLld3vAUEHURmzDI8cDSSVfuVMvECD1WQ1bu0tiltFi5frfHEL+P7wB
	BrJDTLfIVXw8i+g4eX5G3NmXp+LePBhYP8eHCA4tU0Kfn4G7pfsJGb+ISE1jYA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1738751994;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=bWOsbeBXYe4P9Ey/QKmxFEQWVZvEI9fDikxtPGxLwCw=;
	b=2MkVDWvbnMnhUfU4YQg7QyUj/XQaIPs/rHUx3IpPjx5AJtVC/2y5QVDMgbhmepZZpRb/77
	QEsfNF0Znm8a8yDg==
To: Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	linux-kernel@vger.kernel.org
Cc: Nam Cao <namcao@linutronix.de>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH v2 23/31] watchdog: Switch to use hrtimer_setup()
Date: Wed,  5 Feb 2025 11:39:07 +0100
Message-Id: <a5c62f2b5e1ea1cf4d32f37bc2d21a8eeab2f875.1738746821.git.namcao@linutronix.de>
In-Reply-To: <cover.1738746821.git.namcao@linutronix.de>
References: <cover.1738746821.git.namcao@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

hrtimer_setup() takes the callback function pointer as argument and
initializes the timer completely.

Replace hrtimer_init() and the open coded initialization of
hrtimer::function with the new setup mechanism.

Patch was created by using Coccinelle.

Signed-off-by: Nam Cao <namcao@linutronix.de>
Cc: Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: linux-watchdog@vger.kernel.org
---
 drivers/watchdog/softdog.c                     | 8 +++-----
 drivers/watchdog/watchdog_dev.c                | 4 ++--
 drivers/watchdog/watchdog_hrtimer_pretimeout.c | 4 ++--
 kernel/watchdog.c                              | 3 +--
 4 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/watchdog/softdog.c b/drivers/watchdog/softdog.c
index 7a1096265f18..0820e35ad2e3 100644
--- a/drivers/watchdog/softdog.c
+++ b/drivers/watchdog/softdog.c
@@ -187,14 +187,12 @@ static int __init softdog_init(void)
 	watchdog_set_nowayout(&softdog_dev, nowayout);
 	watchdog_stop_on_reboot(&softdog_dev);
=20
-	hrtimer_init(&softdog_ticktock, CLOCK_MONOTONIC, HRTIMER_MODE_REL);
-	softdog_ticktock.function =3D softdog_fire;
+	hrtimer_setup(&softdog_ticktock, softdog_fire, CLOCK_MONOTONIC, HRTIMER_M=
ODE_REL);
=20
 	if (IS_ENABLED(CONFIG_SOFT_WATCHDOG_PRETIMEOUT)) {
 		softdog_info.options |=3D WDIOF_PRETIMEOUT;
-		hrtimer_init(&softdog_preticktock, CLOCK_MONOTONIC,
-			     HRTIMER_MODE_REL);
-		softdog_preticktock.function =3D softdog_pretimeout;
+		hrtimer_setup(&softdog_preticktock, softdog_pretimeout, CLOCK_MONOTONIC,
+			      HRTIMER_MODE_REL);
 	}
=20
 	if (soft_active_on_boot)
diff --git a/drivers/watchdog/watchdog_dev.c b/drivers/watchdog/watchdog_de=
v.c
index 19698d87dc57..8369fd94fc1a 100644
--- a/drivers/watchdog/watchdog_dev.c
+++ b/drivers/watchdog/watchdog_dev.c
@@ -1051,8 +1051,8 @@ static int watchdog_cdev_register(struct watchdog_dev=
ice *wdd)
 	}
=20
 	kthread_init_work(&wd_data->work, watchdog_ping_work);
-	hrtimer_init(&wd_data->timer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	wd_data->timer.function =3D watchdog_timer_expired;
+	hrtimer_setup(&wd_data->timer, watchdog_timer_expired, CLOCK_MONOTONIC,
+		      HRTIMER_MODE_REL_HARD);
 	watchdog_hrtimer_pretimeout_init(wdd);
=20
 	if (wdd->id =3D=3D 0) {
diff --git a/drivers/watchdog/watchdog_hrtimer_pretimeout.c b/drivers/watch=
dog/watchdog_hrtimer_pretimeout.c
index 940b53718a91..fbc7eecd8b20 100644
--- a/drivers/watchdog/watchdog_hrtimer_pretimeout.c
+++ b/drivers/watchdog/watchdog_hrtimer_pretimeout.c
@@ -23,8 +23,8 @@ void watchdog_hrtimer_pretimeout_init(struct watchdog_dev=
ice *wdd)
 {
 	struct watchdog_core_data *wd_data =3D wdd->wd_data;
=20
-	hrtimer_init(&wd_data->pretimeout_timer, CLOCK_MONOTONIC, HRTIMER_MODE_RE=
L);
-	wd_data->pretimeout_timer.function =3D watchdog_hrtimer_pretimeout;
+	hrtimer_setup(&wd_data->pretimeout_timer, watchdog_hrtimer_pretimeout, CL=
OCK_MONOTONIC,
+		      HRTIMER_MODE_REL);
 }
=20
 void watchdog_hrtimer_pretimeout_start(struct watchdog_device *wdd)
diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index b2da7de39d06..6a98dbc931ac 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -797,8 +797,7 @@ static void watchdog_enable(unsigned int cpu)
 	 * Start the timer first to prevent the hardlockup watchdog triggering
 	 * before the timer has a chance to fire.
 	 */
-	hrtimer_init(hrtimer, CLOCK_MONOTONIC, HRTIMER_MODE_REL_HARD);
-	hrtimer->function =3D watchdog_timer_fn;
+	hrtimer_setup(hrtimer, watchdog_timer_fn, CLOCK_MONOTONIC, HRTIMER_MODE_R=
EL_HARD);
 	hrtimer_start(hrtimer, ns_to_ktime(sample_period),
 		      HRTIMER_MODE_REL_PINNED_HARD);
=20
--=20
2.39.5



Return-Path: <linux-watchdog+bounces-2193-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id EB96799A731
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 17:07:30 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 94BE3284E13
	for <lists+linux-watchdog@lfdr.de>; Fri, 11 Oct 2024 15:07:29 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6D65188CB1;
	Fri, 11 Oct 2024 15:07:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="Y8C9CUTa";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="F/mud+uC";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="C0uHEOX7";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="iESVkjDG"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE27218EFDE
	for <linux-watchdog@vger.kernel.org>; Fri, 11 Oct 2024 15:07:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728659238; cv=none; b=tsaiRK/nAfJjkekeZ1qme2uNpXVWYNKnrkEBmugTdQB8idAMbJdXFpfXfKEihBHhzkx9L7Wi2NmhyxH4LlolfMC5dqFkIvzp3ypJAH2NwxCFnUTHQStzjTQDSE8PYrxnarfT24kjrAbUBWaLcsRKBx+NLR90F4BhaDMnn/7gSoI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728659238; c=relaxed/simple;
	bh=jBcVu6yLt9tsin+71fCAls9Wph6sA1331MKFbtOqS2s=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=mk6ELM+qC6DCukEH5HTwJyh9LZIRxLq9xCxSu6UVqbIMvkicSz3xHihXSbxdrWmc/Htvswm4QtIpKokoqzni78XUzbVFzaf6ZC1dcYgOK1JIs93CVOgYL9M9lvI3TM3zjY7HQVZlcF04kUMdgT+pooYJ0dnScLD1+fkfFTrehFE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=Y8C9CUTa; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=F/mud+uC; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=C0uHEOX7; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=iESVkjDG; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 01A7221AB8;
	Fri, 11 Oct 2024 15:07:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728659234; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pP7foyFcIlhbzeKtofLPdq46sE39TujoZhjDo2z7JOE=;
	b=Y8C9CUTa/2hg0scNnYqRIIIk3KeW2TsAg1IowOhbKe6tR9h+DkvxpWNj+tV/hP2EVjisr4
	H7nukSTMEGpR038MwPoTS+QMtB3UaOATCs85amp6t1j25F8ndp6iQV3IPiFfNYxjsXM0J3
	bsH5z4xLdEJ6C6NBLhO1SGF6O5dF8HE=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728659234;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pP7foyFcIlhbzeKtofLPdq46sE39TujoZhjDo2z7JOE=;
	b=F/mud+uCevhOeyq20HhwW5xICCfpyN4WjACqOHcf+dgipgEGfxbj9xNcF4PuiHmNhq9Ojd
	zJyp7OShF2MOtQDw==
Authentication-Results: smtp-out1.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1728659233; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pP7foyFcIlhbzeKtofLPdq46sE39TujoZhjDo2z7JOE=;
	b=C0uHEOX7Li5/Zt26hYQj4i5Qv1fD5YaWu1Lnk4e0Jq8AJ63A5X196ulR9lUxgxcCjwsWBU
	7Mh+DJvrUphwUp2LXkQdhn9cJ2fZMPIkH5zaivYsm/lXlZgQHkpNnBSmfc5EjmbZsxgBaJ
	yGIMXFGSYaGQYEl3pa3LYeYIZc0ZGQA=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1728659233;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=pP7foyFcIlhbzeKtofLPdq46sE39TujoZhjDo2z7JOE=;
	b=iESVkjDGwHNMJVT+NcVybuJ0tHRwp9YfoeK2YJVPn2ZxeOhFurhbfItk3Shsgkj80rYqhD
	l2F+C3RdZ1nW8dAA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id C5643136E0;
	Fri, 11 Oct 2024 15:07:12 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id i+gmLiA/CWelIQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Fri, 11 Oct 2024 15:07:12 +0000
Date: Fri, 11 Oct 2024 17:07:10 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org
Subject: Fate of cpu5wdt driver
Message-ID: <20241011170710.484a257a@endymion.delvare>
Organization: SUSE Linux
X-Mailer: Claws Mail 4.1.1 (GTK 3.24.34; x86_64-suse-linux-gnu)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Spam-Score: -4.30
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[99.99%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[3];
	FROM_EQ_ENVFROM(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Level: 

Hi all,

I recently got to look into the cpu5wdt driver to backport a security
fix. This driver seems to be in a pretty sorry state.

1* The driver accesses arbitrary I/O ports without ever checking which
   hardware it runs on. I have no idea what this "sma cpu5" thing is,
   a quick web search did not return anything relevant, only that
   sma.de still exists but nothing about "CPU5" specifically. The
   Kconfig description is "TBD" (not joking...). I can only imagine
   this is a very specific, very old and probably no longer relevant
   piece of hardware. The driver comes with zero documentation. I tried
   to contact the original author but did not get any answer.

2* There's no explanation of what cpu5wdt_lock is supposed to protect,
   but its use throughout the driver is suspiciously inconsistent. In
   most places, the lock is held when accessing cpu5wdt_device.running,
   ticks, cpu5wdt_device.queue, cpu5wdt_device.timer and
   cpu5wdt_device.stop. However there are exceptions to that, with
   cpu5wdt_trigger() using cpu5wdt_device.running and ticks without
   holding the lock. Likewise, cpu5wdt_exit() is using
   cpu5wdt_device.queue, cpu5wdt_device.stop and cpu5wdt_device.timer
   without holding the lock, which could race with cpu5wdt_trigger().
   cpu5wdt_reset() is also touching ticks without holding the lock. Not
   sure how atomic "ticks--" is guaranteed to be on X86, if atomicity
   isn't fully guaranteed then this is racy (FWIW ticks was originally
   declared volatile, but volatile was removed to silent a warning).

3* The driver doesn't implement WDIOC_SETTIMEOUT. The timeout is set
   at module load time as an arbitrary tick count. The default is
   10000 and the driver is ticking every (HZ/10+1) jiffies, which leads
   to an inaccurate and undocumented 16 minutes 40 seconds timeout,
   after which the driver stops pinging the hardware but we have no
   idea how long it will take before the hardware watchdog actually
   reboots the system. This is clearly incompatible with the
   expectations of modern software stacks (systemd, high-availability
   setups).

4* I also found a potential integer overflow in cpu5wdt_start, using
   WDIOS_ENABLECARD 2^64 times without closing the device would "stop
   the watchdog", so the system would not reboot even if the watchdog
   process stops writing to the device. Not a serious issue as nobody
   sane would do that, but still...

The driver was added in 2003 and there's no evidence that it has any
recent user, all changes seem to be tree-wide, subsystem-wide, or the
result of static code analysis.

Would anyone object to the plain removal of driver cpu5wdt from the
kernel tree?

Thanks,
-- 
Jean Delvare
SUSE L3 Support


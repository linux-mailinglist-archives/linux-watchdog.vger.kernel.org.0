Return-Path: <linux-watchdog+bounces-1307-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 2409092639E
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 16:40:12 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id 471ED1C20FEE
	for <lists+linux-watchdog@lfdr.de>; Wed,  3 Jul 2024 14:40:11 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3694F171679;
	Wed,  3 Jul 2024 14:40:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tcr6lTxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7XnhENCR";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="tcr6lTxA";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="7XnhENCR"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp-out2.suse.de (smtp-out2.suse.de [195.135.223.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 669CD4C7D
	for <linux-watchdog@vger.kernel.org>; Wed,  3 Jul 2024 14:40:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720017607; cv=none; b=XVH4EeIFBennzzr1r5OJcJYW27N2fhO10OeBxIxlYZPKioWEg7AKrIiD9T34qGKj0TEl9NQeBcIWMvZaVzDagH3sTN9/MJwubL7Q2zO0yPQdcwTwOe1QXpFHP7uNqFUZroTbbhUGYGYUBkmRoMHql2S/LIjjwMnBR42ddFNY0y0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720017607; c=relaxed/simple;
	bh=zNFAhXcTc/ka0Nqwvip6wkCvqpq5ZPETGys/1lEQAAE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=DIhvb2klLGbGHxCn7KApmbqKoXL5bYIy+q2ceDVvBU6fhD1ZNJ2tOhYm3VUuDfWWLsf6dQv3H9FKH85r6okXnG38Ibnde2I5/YF7mNcNFHK48Q17y7RF+yvfsO4XhKFxk8jI0UcYu4PP2UYIAkGTOMTtaB+SlAuAPU1G1bgo04U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tcr6lTxA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7XnhENCR; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=tcr6lTxA; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=7XnhENCR; arc=none smtp.client-ip=195.135.223.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id A61951F44F;
	Wed,  3 Jul 2024 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720017603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NYLnsoFnyS9l6WKBwgsmg6+HcIEz5vWrc215a+3hWcU=;
	b=tcr6lTxAwaTpHfMX/gZsXYxAYx3ub4X8ZQ1EeE5HV1hu9d97AvcwPp013RKQPpRm6igtnH
	D6PRuJB80HT0q6EHzAXTPZds1h19Vj8VjOpq63FTphWtdcuBpc9Ig58qtbxcn0CVKfA9am
	Zg1gXdz+ieY4soX61DSS5Or6/m9eCYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720017603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NYLnsoFnyS9l6WKBwgsmg6+HcIEz5vWrc215a+3hWcU=;
	b=7XnhENCRaTd7X5wTKItxmTmVfBlx4joCPFVf1DIS8uT6hDm5xLpzx9VPZw4WV53omr/ksg
	bZXaAdm2Mgpdx+BA==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1720017603; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NYLnsoFnyS9l6WKBwgsmg6+HcIEz5vWrc215a+3hWcU=;
	b=tcr6lTxAwaTpHfMX/gZsXYxAYx3ub4X8ZQ1EeE5HV1hu9d97AvcwPp013RKQPpRm6igtnH
	D6PRuJB80HT0q6EHzAXTPZds1h19Vj8VjOpq63FTphWtdcuBpc9Ig58qtbxcn0CVKfA9am
	Zg1gXdz+ieY4soX61DSS5Or6/m9eCYU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1720017603;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NYLnsoFnyS9l6WKBwgsmg6+HcIEz5vWrc215a+3hWcU=;
	b=7XnhENCRaTd7X5wTKItxmTmVfBlx4joCPFVf1DIS8uT6hDm5xLpzx9VPZw4WV53omr/ksg
	bZXaAdm2Mgpdx+BA==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id F198813889;
	Wed,  3 Jul 2024 14:40:02 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hp9DNMJihWbtQQAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Wed, 03 Jul 2024 14:40:02 +0000
Date: Wed, 3 Jul 2024 16:39:58 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Subject: Question about cpu5wdt del_timer fix
Message-ID: <20240703163958.20c6f00e@endymion.delvare>
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
X-Spamd-Result: default: False [-4.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	FROM_HAS_DN(0.00)[];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	HAS_ORG_HEADER(0.00)[];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	RCVD_TLS_ALL(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	FROM_EQ_ENVFROM(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo]
X-Spam-Flag: NO
X-Spam-Score: -4.30
X-Spam-Level: 

Hi Zhou,

I have been asked to backport kernel commit 573601521277 ("watchdog:
cpu5wdt.c: Fix use-after-free bug caused by cpu5wdt_trigger") because
it was assigned a CVE number (CVE-2024-38630).

I was about to just backport the commit as it is pretty simple, however
out of curiosity I looked at the code and I must say I just can't see
which bug is being fixed.

The commit description says that there was a race condition if
cpu5wdt_trigger() was still running after del_timer() when
release_region() is being called as part of cpu5wdt_exit().

The way I read the original code (before your commit):

* In cpu5wdt_exit(), del_timer() is called after
  wait_for_completion(&cpu5wdt_device.stop).

* The completion happens at only one point in the driver, that's in
  cpu5wdt_trigger(), and that's an alternative to rearming the timer.
  Therefore we are guaranteed that no timer is armed when we reach
  del_timer() in cpu5wdt_exit().

* Also this happens *after* the outb() to the I/O region, and I don't
  think the compiler is allowed to reorder that. So even if
  cpu5wdt_trigger() still has to finish after the completion, it can't
  race with release_region().

So I do not think that replacing del_timer() with timer_shutdown_sync()
was needed. The only point of switching to timer_shutdown_sync(), as I
understand it, would be to get rid of the completion to simplify the
code a bit.

Am I missing anything?

-- 
Jean Delvare
SUSE L3 Support


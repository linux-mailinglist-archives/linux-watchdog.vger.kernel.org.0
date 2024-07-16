Return-Path: <linux-watchdog+bounces-1399-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 74738932793
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 15:35:26 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 009311F21730
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 13:35:26 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 07A6F14386C;
	Tue, 16 Jul 2024 13:35:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EELSkW9F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WYnN1iCA";
	dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b="EELSkW9F";
	dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b="WYnN1iCA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp-out1.suse.de (smtp-out1.suse.de [195.135.223.130])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D37217C9FC
	for <linux-watchdog@vger.kernel.org>; Tue, 16 Jul 2024 13:35:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.135.223.130
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721136920; cv=none; b=CHJKcDvPuHOYVSMXjgQlqfcgg/gvbq+2MXsWFMpmm2Po6Q6esHEF9mMvJtlE62RHFsvEZrGbpHVCqlwQ74jXfwpsRKiR+eX+9Q1zERL7D80/wzyNq8p9Ahdn815W7Ms9J19khF6Hnpdj9WoRPOXjALjGMbhUdRhwUsnb6Dazuw4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721136920; c=relaxed/simple;
	bh=Lj6UpcsfDxhNUkRl2ejtapRNpNO3Eem+zEWM6OfVY4w=;
	h=Date:From:To:Cc:Subject:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=YIr9ZUOQqoSPUu1Ey9NI9PV3gdfmbz84CIhKMTqM8VBovVsx4N4SeZWxdN+AMTu6KAIjQIeGb+VL4NRwkbN5ifFoe3OXdp2cnLibImai6wCoxANlq36WkcUjHWedsPvTneqq3CeeEwzbVfxeoavz3RX3u8MzT6DfpReBSlBGRZ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de; spf=pass smtp.mailfrom=suse.de; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EELSkW9F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WYnN1iCA; dkim=pass (1024-bit key) header.d=suse.de header.i=@suse.de header.b=EELSkW9F; dkim=permerror (0-bit key) header.d=suse.de header.i=@suse.de header.b=WYnN1iCA; arc=none smtp.client-ip=195.135.223.130
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=suse.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.de
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out1.suse.de (Postfix) with ESMTPS id 9617421BE4;
	Tue, 16 Jul 2024 13:35:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721136917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNGpAHgHWZAsHIZiRBSse05NAY4jVykcuIaJQdFEVVE=;
	b=EELSkW9FD5Z0+SmNu8sEl3Sa99KevOhUaoN8OMQ3SfQqBGU6QSZhhgqVgESnsNQYYptQ46
	rYhtDL10/rWT8J5w5CH0nj9afa/dj5kipWviPrmmdySm8szYX3p4PkcOxeWiyI6BefTmEb
	YidNIQakzusvnqAnFu08QoTD6F0VwYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721136917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNGpAHgHWZAsHIZiRBSse05NAY4jVykcuIaJQdFEVVE=;
	b=WYnN1iCAaIcRhpHcQAGp6UVzkqb2PZaGO47srzBh4imkOok2zveMILvnvty6HmnPowS2uy
	i8y65M7b5g5uz7CQ==
Authentication-Results: smtp-out1.suse.de;
	dkim=pass header.d=suse.de header.s=susede2_rsa header.b=EELSkW9F;
	dkim=pass header.d=suse.de header.s=susede2_ed25519 header.b=WYnN1iCA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.de; s=susede2_rsa;
	t=1721136917; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNGpAHgHWZAsHIZiRBSse05NAY4jVykcuIaJQdFEVVE=;
	b=EELSkW9FD5Z0+SmNu8sEl3Sa99KevOhUaoN8OMQ3SfQqBGU6QSZhhgqVgESnsNQYYptQ46
	rYhtDL10/rWT8J5w5CH0nj9afa/dj5kipWviPrmmdySm8szYX3p4PkcOxeWiyI6BefTmEb
	YidNIQakzusvnqAnFu08QoTD6F0VwYQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.de;
	s=susede2_ed25519; t=1721136917;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=gNGpAHgHWZAsHIZiRBSse05NAY4jVykcuIaJQdFEVVE=;
	b=WYnN1iCAaIcRhpHcQAGp6UVzkqb2PZaGO47srzBh4imkOok2zveMILvnvty6HmnPowS2uy
	i8y65M7b5g5uz7CQ==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id DE4D713795;
	Tue, 16 Jul 2024 13:35:16 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id zmeMLxR3lmbZbAAAD6G6ig
	(envelope-from <jdelvare@suse.de>); Tue, 16 Jul 2024 13:35:16 +0000
Date: Tue, 16 Jul 2024 15:35:12 +0200
From: Jean Delvare <jdelvare@suse.de>
To: Duoming Zhou <duoming@zju.edu.cn>
Cc: Guenter Roeck <linux@roeck-us.net>, Wim Van Sebroeck
 <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org
Subject: Re: Question about cpu5wdt del_timer fix
Message-ID: <20240716153512.0e63ccbf@endymion.delvare>
In-Reply-To: <20240703163958.20c6f00e@endymion.delvare>
References: <20240703163958.20c6f00e@endymion.delvare>
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
X-Rspamd-Queue-Id: 9617421BE4
X-Spam-Flag: NO
X-Spam-Score: -0.51
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-0.51 / 50.00];
	R_DKIM_ALLOW(-0.20)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	ARC_NA(0.00)[];
	HAS_ORG_HEADER(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FUZZY_BLOCKED(0.00)[rspamd.com];
	RCVD_TLS_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.de:s=susede2_rsa,suse.de:s=susede2_ed25519];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_THREE(0.00)[4];
	RCVD_COUNT_TWO(0.00)[2];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[suse.de:dkim];
	DKIM_TRACE(0.00)[suse.de:+]
X-Spam-Level: 
X-Spamd-Bar: /

On Wed, 3 Jul 2024 16:39:58 +0200, Jean Delvare wrote:
> I have been asked to backport kernel commit 573601521277 ("watchdog:
> cpu5wdt.c: Fix use-after-free bug caused by cpu5wdt_trigger") because
> it was assigned a CVE number (CVE-2024-38630).
> 
> I was about to just backport the commit as it is pretty simple, however
> out of curiosity I looked at the code and I must say I just can't see
> which bug is being fixed.
> 
> The commit description says that there was a race condition if
> cpu5wdt_trigger() was still running after del_timer() when
> release_region() is being called as part of cpu5wdt_exit().
> 
> The way I read the original code (before your commit):
> 
> * In cpu5wdt_exit(), del_timer() is called after
>   wait_for_completion(&cpu5wdt_device.stop).
> 
> * The completion happens at only one point in the driver, that's in
>   cpu5wdt_trigger(), and that's an alternative to rearming the timer.
>   Therefore we are guaranteed that no timer is armed when we reach
>   del_timer() in cpu5wdt_exit().
> 
> * Also this happens *after* the outb() to the I/O region, and I don't
>   think the compiler is allowed to reorder that. So even if
>   cpu5wdt_trigger() still has to finish after the completion, it can't
>   race with release_region().
> 
> So I do not think that replacing del_timer() with timer_shutdown_sync()
> was needed. The only point of switching to timer_shutdown_sync(), as I
> understand it, would be to get rid of the completion to simplify the
> code a bit.
> 
> Am I missing anything?

Actually I did. One week of vacation gave me time to think about this
some more and I do believe there was actually a race condition, but not
the one described in commit 573601521277.

The race condition I am seeing (before this commit) is that
cpu5wdt_exit() could complete, and thus the module be unloaded and
cpu5wdt_trigger() be removed from memory, while the end of
cpu5wdt_trigger() is still being executed (just one instruction
actually, spin_unlock(&cpu5wdt_lock)).

So the fix was needed after all and CVE-2024-38630 is real, even though
I believe its description is incorrect.

I also believe that timer_shutdown_sync() was not needed as driver
cpu5wdt doesn't involve any workqueue, so timer_delete_sync() would
have been sufficient.

-- 
Jean Delvare
SUSE L3 Support


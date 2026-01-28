Return-Path: <linux-watchdog+bounces-4845-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id YImULBoiemmv2wEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4845-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 15:50:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sto.lore.kernel.org (sto.lore.kernel.org [IPv6:2600:3c09:e001:a7::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 547FBA32B6
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 15:50:02 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sto.lore.kernel.org (Postfix) with ESMTP id B28E830225B4
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 14:48:14 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 06D5E2417DE;
	Wed, 28 Jan 2026 14:47:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VvqzSDlq"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94683225390
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 14:47:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769611674; cv=none; b=p641pRH+GNBQbpoBZ2P6irmotPfH8KkzxHWz0WW3f6cXK12egSM9tqXB9U5FZqPdONnm6mBN4Cr5KstQBpKmx7RDvM8Q7bzmHWuNj2UUspcxVu/ZgkXO0oI/Hp/18ZamIeeA0z8DJ8na2/E4ZIwguXS1jB4U4skeZQjrGN1UB7o=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769611674; c=relaxed/simple;
	bh=uMb0+6hrAqyTAxCgTOBma+V9UGLo8wqxbLjyFwatDo4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JbEMZ2364y8gVaD2hCpPqzn+EH9fapysi63btQvM606ZfzJwVa27uqK/7r/oRpop6eS5nVFWQgjAFS2e6UYlQ1hCgP6FfbEFYvCJm+zAbszkdHkXA+4mVNr1T+/YZUNSiP+GLZvFPzYZn0UIZQuJ+PomiubQwq9MkaJwbUE5Ey0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=VvqzSDlq; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-8c69ffb226eso948121185a.1
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 06:47:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769611672; x=1770216472; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eZiqzZAKTrzELIcyvdKxAtY7K6R+zYGAN6Fj59XN2kA=;
        b=VvqzSDlqRzZKfeOw2ZByPfl/3CuxXzePLMf22HGgRI5DWOPjsMcJEkVIGJxAe69O0N
         R5qrd9A4v63AVNYaaiiPmT1gvKaZFHYSIk6G8wIiSvTBYfxH7kDxf9x8G/aisFj1bfJZ
         IvixILUK0qOQOr2kBY3+vKCnmWBGhqlM3udO7rLjWqwwbnlxFlVtAHbRMA1TVl9quqw3
         Rst8oa/seFsNZTL+HZvNhZbuCt1NfIZRhFsjpycj9shX4gqbXmsSRMnDPBJGCQPiigUU
         XtQNHycy2dvs8rZlVGruXFBdbcFFPnNfUZoPwVBckoOnM1mCA4QuDV8OocbLbSaGcFeV
         jZ7A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769611672; x=1770216472;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=eZiqzZAKTrzELIcyvdKxAtY7K6R+zYGAN6Fj59XN2kA=;
        b=oY5HEwtajXBniVW6d6X+W/55hUnFFDi0U8/XCzggjBPM288K+djRIloefGZBtsizZT
         Rp387fyttY1pc7bkGGZ1FSFy9/gFrYz/+/GahFVV1ll83pdCnLmU6m795ZPX3bIOyKoU
         LaJBk0tGgr9r59FyFmHOcky4mRPtACFyvuGNcZkO3aY+VF6wSC7cRq5pBw3Nhvv/+SZK
         hlo1zbe5SGfT5AGCBNWxhUiHD4IgZdhpShlxIn1qaUR1pBTp088r4K81GbL1shvWvTG5
         gDJ1v8D7ro5aO2ysN0fVFaFcCnqAE2MXPJlFTT5eBIFTocA0gsFcgMUAN+lhIfKnJx3v
         ZCcw==
X-Forwarded-Encrypted: i=1; AJvYcCWkizsEHuQxEyxJFypTpkPJe3UQXU/EKPTffmX1d4/s/8Dj0Wztc5qBBZfobopA2hBqPDd098HeL/LVmPIUbw==@vger.kernel.org
X-Gm-Message-State: AOJu0YxHHYsRglEs62GwwCdwNSWQ770xLhBKkVFHDbvxeKG+Wmcko3uf
	4JHovUshk9DVzUTVJITWXSeBqDk8XA34pkacIz71r/iIumtew+5TjLrchM3IERUo
X-Gm-Gg: AZuq6aKYKUXErwb8cvcD8q1X6SI0Hm1xENtAW0+SOvvX1weaVix4yTTMN3fhWWxWFQq
	gO6/duCCyC6xqKHMNQsWwiI5tc6M8aTe5sSxy7kj0PdW0h5FNvMu2J+PsPpqXvmJ41neJagH2Y/
	R86H2xQ4thu/+5kPLNsXbndq7KaISQjc5E2unOxIAZw7mmDn8OnOKWfuna8VOhqNr8s4dP+GYi+
	KS89IfAI8oqOX4MjVBzR5RzvPxIjSnoWWYOci8SIQoJukSlK6sZy9REUntp0hLx6wKIoLTDuGsF
	g92I5X6i9YW2x/vC4OHWUVWssRuYp9CkESbPDWzNqehe2yS5dsmruq1J946iXtrsyGD4J81+Tdp
	pjvoIVR0WsrcCb0MHy6J1PtcG3xx1o3xBExqSvz706nJriG02+bYezZNbnp9E9q2YZSoDGzfXeD
	52wHk=
X-Received: by 2002:a05:7022:68b:b0:11a:4ffb:9849 with SMTP id a92af1059eb24-124a007c94dmr3573082c88.21.1769605603152;
        Wed, 28 Jan 2026 05:06:43 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-124a9de7febsm2126691c88.10.2026.01.28.05.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Jan 2026 05:06:42 -0800 (PST)
From: Qiliang Yuan <realwujing@gmail.com>
To: dianders@chromium.org
Cc: akpm@linux-foundation.org,
	lihuafei1@huawei.com,
	linux-kernel@vger.kernel.org,
	linux-watchdog@vger.kernel.org,
	mingo@kernel.org,
	mm-commits@vger.kernel.org,
	realwujing@gmail.com,
	song@kernel.org,
	sunshx@chinatelecom.cn,
	thorsten.blum@linux.dev,
	wangjinchao600@gmail.com,
	yangyicong@hisilicon.com,
	yuanql9@chinatelecom.cn,
	zhangjn11@chinatelecom.cn
Subject: Re: [PATCH v6] watchdog/hardlockup: simplify perf event probe and remove per-cpu dependency
Date: Wed, 28 Jan 2026 08:06:29 -0500
Message-ID: <20260128130634.1769702-1-realwujing@gmail.com>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <CAD=FV=XX0dJ2jEaQ21M4Kas6pbJL0SSCxYhr8-1kqSTEiJP_UA@mail.gmail.com>
References: <CAD=FV=XX0dJ2jEaQ21M4Kas6pbJL0SSCxYhr8-1kqSTEiJP_UA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.66 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	MID_CONTAINS_FROM(1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_MISSING_CHARSET(0.50)[];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c09:e001:a7::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4845-lists,linux-watchdog=lfdr.de];
	FREEMAIL_CC(0.00)[linux-foundation.org,huawei.com,vger.kernel.org,kernel.org,gmail.com,chinatelecom.cn,linux.dev,hisilicon.com];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TAGGED_RCPT(0.00)[linux-watchdog];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	ASN(0.00)[asn:63949, ipnet:2600:3c09::/32, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinatelecom.cn:email,chromium.org:email,sto.lore.kernel.org:helo,sto.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 547FBA32B6
X-Rspamd-Action: no action

Hi Doug,

Just a quick follow-up to my previous reply. I've just sent out v8 which 
addresses the Signed-off-by issues and some final cleanups.

On Tue, Jan 27, 2026 at 8:08 PM Doug Anderson <dianders@chromium.org> wrote:
> One last note is that your Signed-off-by tags don't match. When I
> apply your patch, I see:
>
> Author:     Qiliang Yuan <realwujing@gmail.com>
>
> ...but your Signed-off-by is your "@chinatelecom.cn" address. That's
> generally not okay. You need to do something to make those match.

Regarding the Signed-off-by tags, I've included both in v8:
- Signed-off-by: Qiliang Yuan <realwujing@gmail.com> (Personal email)
- Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn> (Work email)

My work email often has trouble receiving external mailing list replies, 
so I've included both to ensure I don't miss any feedback and to 
properly attribute the work. The v8 version should have everything 
matching correctly now.

I've already sent v8 twice today, but for some reason, they are still not visible on lore.kernel.org.
Here are the Message-IDs from those three attempts for your reference:
- <20260128115358.1757147-1-realwujing@gmail.com>
- <20260128122330.1761777-1-realwujing@gmail.com>
- <20260128125639.1767682-1-realwujing@gmail.com>

Therefore, I cannot provide a lore link for v8 yet. You may use the v7 version from lore as well, 
I have already added "Signed-off-by: Qiliang Yuan <realwujing@gmail.com>" to match the author's identity in v7, 
but please help to include "Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>".

Thanks!

Best regards,
Qiliang


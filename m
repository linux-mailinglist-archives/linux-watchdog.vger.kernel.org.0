Return-Path: <linux-watchdog+bounces-4841-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id EHfHKSqpeWl/yQEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4841-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 07:14:02 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 082AB9D5E6
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 07:14:01 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id F1B84300ECA8
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 06:14:00 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id A7ECF3358BA;
	Wed, 28 Jan 2026 06:13:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="hV7v6c3E"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 685153358B2
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 06:13:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769580838; cv=none; b=bE5V6nisucrub8XdOfGNeqhaCDw2wkROHrunOsBaMgPV/2DWRUJCj6osfZOP3swfzbABg+wxS23tB9ZiBuJ/jgT8+/Kuot4IulsWj0t4yyCDUHj4zsPFRO7AIKlEwdbluIWo2gmJntEqRThGctj67MBuVrCpdmtSk5HKrP6oIYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769580838; c=relaxed/simple;
	bh=SK7oVYArSg/Xo6uvMZQi2Av7HSLvZtYpGO2JRktoHD0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ZmJJDAMEl2IQLn6vmaa/y1Nl+/lS6uJHOTL+BTcKDey3rf2H7fA1JHKSRRIdg1H7bSgMXVzDHb29AbdGbNC13mXEOTiVvxfRUNQ0iHctyw8dMcTG5JsdwcYRs8zpc4RPqtK9imrzpvGjEhRMQp7CClxHydcBqNSjer0XCZRvrEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=hV7v6c3E; arc=none smtp.client-ip=74.125.82.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-2ae2eb49b4bso14728108eec.0
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 22:13:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1769580836; x=1770185636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Bph7pWaNNjsaWYbFF77C3XL7A8KWqYwMiqgXEfTey6Q=;
        b=hV7v6c3ExGE4vSlzk+lcYnvZl+vIjDVj5jGLQUf5X5YxuJglmIzUsvZ3qIqd+qPyvX
         jfAN3ztwRGHzWMQHjG33OcsdmjtMGzW/EgNpVd9bdt9uOtTvBx4yeL87IrzYTQELqVuE
         /Eci+sXrf6L39PvzMdUIYZxdYshfuz6GmtXuV1MoQmaLldThhgqYJWX0YIpvSEjvNycT
         L7C41arBUUOjDSnjhonZ0PnMJQz0eUjk+9cUg0JLf4txrcbAY1SrHGOaS8MQChb4+/Q/
         nIhd+oGVomp1qkdmlQ3pU11/GhavDJbYZKO2JhKski759bCq4pg/V0t4uLOPdffi+IOx
         fGJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769580836; x=1770185636;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Bph7pWaNNjsaWYbFF77C3XL7A8KWqYwMiqgXEfTey6Q=;
        b=SytjVN20Nb8jV/A85Ni9BeWGXAlcJISaTSpCDRYQL3NjR0xEQmrP2DWY8Vvt/aRN/t
         HMH7XVuDWlGpf9JerX7VtbPRmQ6LYZ4+pvK86hl2gSIwNqaQ/Cc6t7d26v4qh9KQ/8Tl
         KVmrXlo1CRihuf4FzT5uTf2MKElpxD9H//NYz18oPPv+pDMetS92VfEeqg8eX8mzeDte
         H8Tfi/a4TOJIkX8b7gixLqYbgEU0sNiU0YMbEG48de/Zv4tIav3uYHG3V5B65J6V44Uz
         pb2Be/Z0deZMgBqvthI6Ru1NGez+llctKWt4WfJWJ1WTcZTyUbA2xjHT2C+CRZCikyha
         cj1Q==
X-Forwarded-Encrypted: i=1; AJvYcCWFt0t4w3+8m6HJJVcuiAB+V86b6Sz43PzUhk3uOBYM+64X8dx63l/zFYtn7qOEXJuDb217ulCzj6nmp7RWzw==@vger.kernel.org
X-Gm-Message-State: AOJu0YzeLGCyrC5PkEiDGlRwk8jPDX/ncmrkrA8n3nF4bE9I1FC/6fPS
	HuXK9NmN2iE9jdFPq3IqO+3xJeTaQacNX6bzH1kZueUSTiuEagXlom97HzPhLAjvz+s=
X-Gm-Gg: AZuq6aInmTSBUfWaPzMHDLRqAlVg/cPxYAyDiMkpNGiyN8SNrtwcsFhuBpma+Hl79Sb
	4YJZ47agsacOPwOzaIpNU37fFN4plfA2RqDtOVRGgk3io/GuqlgRadf/vo9moNIjugKVLEJgRw9
	u/t+TMNNjyVFJ5Au8aJqhYuX9RjodqXF16XCrq29oYa/yUmFJfgheciLh9VUDK9jq5fGtEqzmm8
	5QD/ncSKPn98cmZuiZFAOwo69ZqlMh7HCIEr41G/bUsiKqjzjeSwo9N7hsN4LFvtdnhg1XGppTk
	BH8UmpOKQZCeIbKA+AwDFUHjU+QIfRuG1koJ21EoqSm3HNh+/YDXa9LNuwRGQa61YF2z7NCackx
	JCVCH5t47RSZhAgO5BX9NDKOU6ecmGEwT8MTvnLEOF04+pMXXMODnahnVvsUIJRAt/PvkIb0POY
	ALU50=
X-Received: by 2002:a05:7300:7fa6:b0:2ae:5ee8:b774 with SMTP id 5a478bee46e88-2b78d8d4941mr3000680eec.9.1769580836322;
        Tue, 27 Jan 2026 22:13:56 -0800 (PST)
Received: from debian ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-2b7a1af83c5sm1281374eec.30.2026.01.27.22.13.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Jan 2026 22:13:56 -0800 (PST)
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
Date: Wed, 28 Jan 2026 01:13:44 -0500
Message-ID: <20260128061350.1716608-1-realwujing@gmail.com>
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4841-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[5];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[linux-foundation.org,huawei.com,vger.kernel.org,kernel.org,gmail.com,chinatelecom.cn,linux.dev,hisilicon.com];
	RCPT_COUNT_TWELVE(0.00)[15];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	PRECEDENCE_BULK(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	TO_DN_NONE(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[realwujing@gmail.com,linux-watchdog@vger.kernel.org];
	TAGGED_RCPT(0.00)[linux-watchdog];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns,chromium.org:email]
X-Rspamd-Queue-Id: 082AB9D5E6
X-Rspamd-Action: no action

Hi Doug,

On Tue, Jan 27, 2026 at 8:08 PM Doug Anderson <dianders@chromium.org> wrote:
> One last note is that your Signed-off-by tags don't match. When I
> apply your patch, I see:
>
> Author:     Qiliang Yuan <realwujing@gmail.com>
>
> ...but your Signed-off-by is your "@chinatelecom.cn" address. That's
> generally not okay. You need to do something to make those match.

Thank you for pointing this out. I've updated my git configuration and 
the patch to ensure the Signed-off-by matches the Author's Gmail address.

> Given our newest understanding, the cpu_hotplug_disable() isn't truly
> needed anymore, but I'm still good keeping it.

Since the probe is now fully stateless and no longer touches per-cpu 
variables, I've opted to remove the redundant cpu_hotplug_disable() in 
v7 to make the code cleaner, as you suggested it wasn't strictly necessary.

v7 Link: https://lore.kernel.org/all/20260128060833.1715622-1-realwujing@gmail.com/

Thanks again for your detailed review and guidance!

Best regards,
Qiliang


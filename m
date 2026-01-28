Return-Path: <linux-watchdog+bounces-4847-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id AKAHK9VMemkp5AEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4847-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 18:52:21 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [IPv6:2600:3c0a:e001:db::12fc:5321])
	by mail.lfdr.de (Postfix) with ESMTPS id 0BA17A73F5
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 18:52:21 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id ADFBB30C80B5
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 17:46:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E6BF836EA91;
	Wed, 28 Jan 2026 17:45:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="McmDtG5/"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31AD736EA82
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 17:45:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769622355; cv=none; b=fgPD09G/4zG/zApxwVfV7wBlYFg/q6rqtc3wBE4Bt7FKE7F13SkzTxyYtf8ZC7RY/F4xmmbAGNnWv6lk118b+g3qNVnDdawjmPyf4Z7DIUaGAG3+frLtsXFA9dIXqz435mIYqvy+rgUAG9TGyc7lzWhkVi9rnqlQ2Sbx8o7gz5E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769622355; c=relaxed/simple;
	bh=/DSD2/sPyL8FmcHgyMED94jzTeSwMun6lVd6lxWucrk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=XnXExHQ+O86+zhEr2CjK1VlunsNc5EL3I0VshDjGPkVjOon3qsHZkgfL2cDGmgLmBz7BtZAMExQWJhQyQgXIsl+fmqJiiXBm298/xkSKaXpL1VG7b2xk2zuSt8PtLPi+xN1NfB3zD+wDg7phoWbdGrAzsJRckwIgX008bwYctzY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=McmDtG5/; arc=none smtp.client-ip=209.85.218.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f42.google.com with SMTP id a640c23a62f3a-b884d5c787bso25480866b.0
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 09:45:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769622350; x=1770227150; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xnoeltQBlPZ0H7ua38KhvkZ21OQ9tEi8rtpciY4lEe8=;
        b=McmDtG5/gcNScalTCOdzIX/N0zbsujx2ir67BzUjMYc9cDOsbEZsHNtxiGQrE2s3nN
         v3Mld3OC1z2xpXs8ZnSwUc1nofVxXyqc4/RIE1l3bgNL8LhX4Uyhvpg+TNdyf1dFnQ15
         qEzujoQdSliBQ48fncEHn7KIjjwIZbZTzRir8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769622350; x=1770227150;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=xnoeltQBlPZ0H7ua38KhvkZ21OQ9tEi8rtpciY4lEe8=;
        b=kd3o6jJFn0/pNhC7MKLodtU/pjhNgqsBAWgg9zggmMmWldZbI1pm2fOpDWlvhFYRZX
         5BfKIIU+GUJTLdG1vj/Av5iGgCvuNbY67lFrc3FMcEyVvgCovmVAZaU/HkpjXwF1AhKe
         pOhI9uQz6S0ZYRmQBCZcdvO5dY7SjOtvmq/jj1h+f0cbRV6RvUN4ICDl0CQgh3OON7F6
         RlXgOutUSM4ayt7muCuCoH7vKXO3zBlnPnXL8o2LxJL4ZFIkIPCvhL69F5oWd6+phlvD
         vZ46g6X0oENumu1y/QwoSNADjZoaO/LjG0dT8eavewEhaO8jF/Fa+PXTVFVU23f2SUF6
         3cwg==
X-Forwarded-Encrypted: i=1; AJvYcCV6iE+4QAZyfBjKN8tlNH+ke/QkE2nY/RxOYuo3zkQdj8ZarVNKaAA3XsovBp0lmrEYnj3j5xPIFAZWx7wO2w==@vger.kernel.org
X-Gm-Message-State: AOJu0Yw6S2RDZ064XXEEg4A3HGZLNL7i+5vBEsx8q3ilyy/h88J4SeFU
	gbLCBZRQH56HaINVu02L8lfJevHk5xEApaX5itrLMjycgfa5P0G8SLSg6xf3gkmO/FnQLcARPQA
	PDUEurZwU
X-Gm-Gg: AZuq6aL6eoBWlqE2sbCsddMa9T4TbqyLG50l0Si1lrRJbXgfBphYTs3c5sEYuIbP/0E
	AnjW+lA0OQVPaIt/06gsib4lpQCOSi0yS97TXLw1ucPQgukINwJ0+sRytcVQND8USE7n726BbdV
	+h3tb7b4A1Fc/ik7lkmvdyFYiqAVNlYcRTBEHxDWHHr5lKuCZWxEura8+uT8pWj5+8kaHY8tUI5
	YESpq5gx4q6wBuWhujMPfEC9AcN1fEa2e2NxeLxEtaBrAtLyfCPAcxN8keWDizQDvpcCfXzvf6X
	qmWH8o70DIyYHBBl48X/xO4a0f/w8z28F7S5tM3j38QPGF/FoxSFLbRHX/sJT18iSgb9Rv641rR
	BRpJIhzSkNFjYADQf2+Y2ZC9OEaykdATYm3IAsoJG2WbGaR1JftIIqpoaZp7VN8WJAYMUAHJtjk
	l+OHhC+crGX16nhAEtHQnDV46JalSxQeJFm86KN+FyArMCVQSLVQ==
X-Received: by 2002:a17:907:7b8b:b0:b83:a32f:8106 with SMTP id a640c23a62f3a-b8dab39db5cmr449145866b.46.1769622350042;
        Wed, 28 Jan 2026 09:45:50 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf2ed584sm154373566b.61.2026.01.28.09.45.48
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 28 Jan 2026 09:45:48 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-435a517be33so117677f8f.0
        for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 09:45:48 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXn+/+w8PE/hwUSXC+Lnv6mhVwXiwNCsvKiT+bIw/fm+ZTKQEnoGrBYdNaLtBy7U85HvZ1x5mLGKcKyFR13kw==@vger.kernel.org
X-Received: by 2002:a05:6000:290f:b0:431:32f:3159 with SMTP id
 ffacd0b85a97d-435dd0515ccmr8337100f8f.7.1769622347483; Wed, 28 Jan 2026
 09:45:47 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128115358.1757147-1-realwujing@gmail.com>
In-Reply-To: <20260128115358.1757147-1-realwujing@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 28 Jan 2026 09:45:36 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VrFw42KRfR=ysP=MSWnukQGnwGwoAu310TG3KUU9cp3w@mail.gmail.com>
X-Gm-Features: AZwV_QhlaVCDV7ybg4oJPu9aF6t-TzoOyVFwOrBGKKCD7DAAb9Htu1_9kAyr3ws
Message-ID: <CAD=FV=VrFw42KRfR=ysP=MSWnukQGnwGwoAu310TG3KUU9cp3w@mail.gmail.com>
Subject: Re: [PATCH v8] watchdog/hardlockup: simplify perf event probe and
 remove per-cpu dependency
To: Qiliang Yuan <realwujing@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Li Huafei <lihuafei1@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Thorsten Blum <thorsten.blum@linux.dev>, Yicong Yang <yangyicong@hisilicon.com>, 
	linux-watchdog@vger.kernel.org, mm-commits@vger.kernel.org, 
	Shouxin Sun <sunshx@chinatelecom.cn>, Junnan Zhang <zhangjn11@chinatelecom.cn>, 
	Qiliang Yuan <yuanql9@chinatelecom.cn>, Song Liu <song@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[chromium.org,none];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	R_SPF_ALLOW(-0.20)[+ip6:2600:3c0a:e001:db::/64:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	TAGGED_FROM(0.00)[bounces-4847-lists,linux-watchdog=lfdr.de];
	FREEMAIL_CC(0.00)[kernel.org,huawei.com,linux-foundation.org,gmail.com,linux.dev,hisilicon.com,vger.kernel.org,chinatelecom.cn];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[chromium.org:+];
	ASN(0.00)[asn:63949, ipnet:2600:3c0a::/32, country:SG];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	RCPT_COUNT_TWELVE(0.00)[14];
	TO_DN_SOME(0.00)[]
X-Rspamd-Queue-Id: 0BA17A73F5
X-Rspamd-Action: no action

Hi,

On Wed, Jan 28, 2026 at 5:29=E2=80=AFAM Qiliang Yuan <realwujing@gmail.com>=
 wrote:
>
> Simplify the hardlockup detector's probe path and remove its implicit
> dependency on pinned per-cpu execution.
>
> Refactor hardlockup_detector_event_create() to be stateless. Return
> the created perf_event pointer to the caller instead of directly
> modifying the per-cpu 'watchdog_ev' variable. This allows the probe
> path to safely manage a temporary event without the risk of leaving
> stale pointers should task migration occur.
>
> Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
> Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
> Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
> Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Song Liu <song@kernel.org>
> Cc: Jinchao Wang <wangjinchao600@gmail.com>
> ---
> v8:
> - Add Signed-off-by with work email.
> - v7 link: https://lore.kernel.org/all/20260128060833.1715622-1-realwujin=
g@gmail.com/
> v7:
> - Update Signed-off-by to match author email.
> - Remove redundant cpu_hotplug_disable() in probe path.
> - v6 link: https://lore.kernel.org/all/20260128023136.1691973-1-realwujin=
g@gmail.com/
> v6:
> - Change title to "simplify/cleanup" and remove "Fixes" tag since the iss=
ue
>   is not reproducible on mainline.
> - Rewrite commit message in imperative mood.
> - Clarify that mainline is safe while this improves robustness.
> - v5 link: https://lore.kernel.org/all/20260127022238.1182079-1-realwujin=
g@gmail.com/
> v5:
> - Refine description: clarify that the retry path uses worker threads
>   without PF_PERCPU_THREAD (though mainline is safe due to system_percpu_=
wq).
> - v4 link: https://lore.kernel.org/all/20260124070814.806828-1-realwujing=
@gmail.com/
> v4:
> - Add cpu_hotplug_disable() in watchdog_hardlockup_probe() to stabilize
>   the probe CPU.
> - Update description to explain the relevance of 4.19 logs.
> v3:
> - Refactor hardlockup_detector_event_create() to be stateless by returnin=
g
>   the event pointer instead of directly assigning to per-cpu variables.
> - Restore PMU cycle fallback and unify the enable/probe paths.
> v2:
> - Add Cc: stable@vger.kernel.org.
> v1:
> - Avoid 'watchdog_ev' in probe path by manually creating and releasing a
>   local perf event.
>
>  kernel/watchdog_perf.c | 51 ++++++++++++++++++++++++------------------
>  1 file changed, 29 insertions(+), 22 deletions(-)
>
> diff --git a/kernel/watchdog_perf.c b/kernel/watchdog_perf.c
> index d3ca70e3c256..4a798443033b 100644
> --- a/kernel/watchdog_perf.c
> +++ b/kernel/watchdog_perf.c
> @@ -17,6 +17,7 @@
>  #include <linux/atomic.h>
>  #include <linux/module.h>
>  #include <linux/sched/debug.h>
> +#include <linux/cpu.h>

IIRC, the above include was added for the call to
cpu_hotplug_disable(), which has now been removed. The #include can be
removed now, right?

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>


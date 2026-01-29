Return-Path: <linux-watchdog+bounces-4854-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id aPYhNFqIe2mlFQIAu9opvQ
	(envelope-from <linux-watchdog+bounces-4854-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 17:18:34 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 48891B208D
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 17:18:34 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 32A6C3002E59
	for <lists+linux-watchdog@lfdr.de>; Thu, 29 Jan 2026 16:18:33 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4822B33D6F5;
	Thu, 29 Jan 2026 16:18:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="mpKiW3AA"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7E61B1DE3B5
	for <linux-watchdog@vger.kernel.org>; Thu, 29 Jan 2026 16:18:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769703511; cv=none; b=nd9wJ6ChNNQlMDaZOZKZgdC+0mtJ02GuXW8n4/wY+4G5QsDduZ8MS0CB64/SJ3oIz2RZuLGvtfvg5xiAk6sRmcXAw3etRMW9wEUizYMP4RypPb0qjtks9/KqmVDLjHE0tAMxLSsvYeuktL+fSSF627NECZjJ+6XW9rbJJ1UWt7A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769703511; c=relaxed/simple;
	bh=FyxdE3i0S0sOMCiAqRnDE/JGv8BUQ7rwgYssZ0u2i1s=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=qok2OgxRwA7Xud6uGC0hNoJ9DnFWYLR3VxDTF+XXiSDnsKLU5wHAUvlJa41Oyb/MRUIJuyqTZg6Ie5Yr7Dxv7ZthwEHDtA08Yf9tXa9O8u6lnDjw/P7Xn266IDuJxya+whvSVGjmHpmFpZT+hUe27QkV5FfOfng6J5L+3HfOZ5s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=mpKiW3AA; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b872f1c31f1so159827566b.0
        for <linux-watchdog@vger.kernel.org>; Thu, 29 Jan 2026 08:18:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769703504; x=1770308304; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=KB9Cy4FVJg8wm+puQzne477B0+DW4cZTlodUY8Maklc=;
        b=mpKiW3AAVH2AtuAXbuY+ageyixoiafnWFO/SjGRNRSqMScZJ5bgAkAFaA+2V7SRdIe
         zVS4Qp7OvTYEFyGES7MvErzbkWe3yPmLSSIxu6EzIOcWePw1DyaOwEO/CjHdPkHnk+j+
         QM82x1xzee3gwns9z0kpFh5G4sdGuHOyT1wMI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769703504; x=1770308304;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=KB9Cy4FVJg8wm+puQzne477B0+DW4cZTlodUY8Maklc=;
        b=qOT8dejawKBdr791Lq/yvz3UDg1qBLxTyQsrKJcuJLH5KHlmERH6xwN4A+F0l5xLSa
         xqp9SSVfWUOrxIXVGV0FiBdWzHeeDCg+lw7OaVcW6c1tD6fy+mKlvZIryZluBJJgJdxW
         ho5/6orjUNNDb68l0T7dt65KCc5nbpleRYUWoDH5QKctR+k9rBMajjZ1LRfun91SsGXA
         hLTet+pbaVkhj88MFE49pfibUkFaMaklLZJO3RJcEGg+vWhz62Aw2KIIoY/hSFW1WK4n
         ElRxLEn9fiEtfHjCgPCGwxsrgYUDP7wlvI3UnrOzfWUP65XehW2kmRw8Am0QDxjHaH+/
         V8WQ==
X-Forwarded-Encrypted: i=1; AJvYcCW34sQeqDMxi2N/t7ye0oOC0vLENChNqqvTNYGadZc2xxsP0kEcHHpzx6DSqaxtdSH0Y46S9usTfLfh7gtvrA==@vger.kernel.org
X-Gm-Message-State: AOJu0Yyvu6Mf8UYgqWPhfdaRi5sHw1C8G9MiysPQv2qdVaPM9vJtkJ8L
	nx7XB6dMW/PTLR7BU1i8K7mwtaz2WrawHNIVb1WmKbxs+CKRu2oSKpg1U/R61WyAA7lwBkWommK
	Ymb/pNA==
X-Gm-Gg: AZuq6aIiT9Wc5a73KsVqnpQWBMFqSgu0OkqJwpqsuEZZ37msYdCaN/2a/5gHiZkvpVO
	x2/1dFyx92UKhsMOF+jr0wtjcf6lxfCzjDDVJPQBCH4VhleRIEt1sMqUV6aCDMassc0I9vRI8ND
	OPJXG7Nvy6wwhE0AakWeFOZTRE/E237lw3zr9SGd/ZkP8+dfKxA6wSUGdHIs+RVTLtpn8nGQDEQ
	0zLc7IYgrakuB2DmLzi/awE07WSiDKVVG7BXSIFRNE1cde5ljw9V4ZGmuQlwT/v0X7SJE4N8AwA
	4pz3SSumTnO99TDHTcjVa1Gkn/tnSvyBaL0Fker9pTyO9AynjBoJARQbDLuKqQmZ+UIYvVq3smN
	jNdv/jjPkbLJK8uRKL9R8bvKzkH2rynsXbcQWarLc2zrZFyD55xlhhDjLw7UF32nCLhhurTShps
	Bum0odQfs8zSeG2F2WG61geTzdUhMatlhppJmsqsNBfGh4jXTcWw==
X-Received: by 2002:a17:907:9691:b0:b83:15cb:d491 with SMTP id a640c23a62f3a-b8dab361960mr641610266b.53.1769703504504;
        Thu, 29 Jan 2026 08:18:24 -0800 (PST)
Received: from mail-wm1-f54.google.com (mail-wm1-f54.google.com. [209.85.128.54])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbf1c0213sm282989266b.48.2026.01.29.08.18.21
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 29 Jan 2026 08:18:21 -0800 (PST)
Received: by mail-wm1-f54.google.com with SMTP id 5b1f17b1804b1-48068127f00so10057475e9.3
        for <linux-watchdog@vger.kernel.org>; Thu, 29 Jan 2026 08:18:21 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCVXAA1spUyAUg+w0xo8UXWUAG2ZijBRTyTBeGbQ7U0AfU8cIOxbYfE+YJ10B3bUEQwrciv9f0+t4agViEGzeQ==@vger.kernel.org
X-Received: by 2002:a05:600c:a44:b0:47e:e2ec:995b with SMTP id
 5b1f17b1804b1-48069c2098cmr117091455e9.9.1769703501228; Thu, 29 Jan 2026
 08:18:21 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260129022629.2201331-1-realwujing@gmail.com>
In-Reply-To: <20260129022629.2201331-1-realwujing@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 29 Jan 2026 08:18:09 -0800
X-Gmail-Original-Message-ID: <CAD=FV=VpV19wB5uGUCRDnCO_SktL3Svnh3V+NT5oNji70Ff3pw@mail.gmail.com>
X-Gm-Features: AZwV_Qi6iIvkb9CRih937uKay1QnRrNoDBbLHqezMGvplj5D710QE3pctSSd19g
Message-ID: <CAD=FV=VpV19wB5uGUCRDnCO_SktL3Svnh3V+NT5oNji70Ff3pw@mail.gmail.com>
Subject: Re: [PATCH v9] watchdog/hardlockup: simplify perf event probe and
 remove per-cpu dependency
To: Qiliang Yuan <realwujing@gmail.com>
Cc: Ingo Molnar <mingo@kernel.org>, Li Huafei <lihuafei1@huawei.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
	Yicong Yang <yangyicong@hisilicon.com>, Thorsten Blum <thorsten.blum@linux.dev>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[kernel.org,huawei.com,linux-foundation.org,gmail.com,hisilicon.com,linux.dev,vger.kernel.org,chinatelecom.cn];
	TAGGED_FROM(0.00)[bounces-4854-lists,linux-watchdog=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[14];
	DKIM_TRACE(0.00)[chromium.org:+];
	MISSING_XM_UA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-watchdog@vger.kernel.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	DBL_BLOCKED_OPENRESOLVER(0.00)[chinatelecom.cn:email,mail.gmail.com:mid,tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 48891B208D
X-Rspamd-Action: no action

Hi,

On Wed, Jan 28, 2026 at 6:26=E2=80=AFPM Qiliang Yuan <realwujing@gmail.com>=
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
> v9:
> - remove unused `#include <linux/cpu.h>`
> v8:
> - Add Signed-off-by with work email.
> v7:
> - Update Signed-off-by to match author email.
> - Remove redundant cpu_hotplug_disable() in probe path.
> v6:
> - Change title to "simplify/cleanup" and remove "Fixes" tag since the iss=
ue
>   is not reproducible on mainline.
> - Rewrite commit message in imperative mood.
> - Clarify that mainline is safe while this improves robustness.
> v5:
> - Refine description: clarify that the retry path uses worker threads
>   without PF_PERCPU_THREAD (though mainline is safe due to system_percpu_=
wq).
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
>  kernel/watchdog_perf.c | 50 +++++++++++++++++++++++-------------------
>  1 file changed, 28 insertions(+), 22 deletions(-)

Since I previously gave you my Reviewed-by tag and the changes you
made were minor (and exactly what I requested when I gave you my tag),
you should have kept my Reviewed-by tag in your v9. In general,
knowing whether to keep someone's Reviewed-by or Tested-by tag when
sending a new version is a bit of a judgement call, but in this case
it should have been pretty clear. Generally, if you remove someone's
tag that was given before it's good to mention "after the cut" why you
removed it. If you are unsure about keeping a tag but still decide to
keep it, you can still call attention to that fact "after the cut".

In any case:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

No need to send a v10 adding that tag unless other changes are needed.
Andrew will add it when landing.

-Doug


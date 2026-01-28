Return-Path: <linux-watchdog+bounces-4838-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id GIgXG86LeWlAxgEAu9opvQ
	(envelope-from <linux-watchdog+bounces-4838-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 05:08:46 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id D7DB29CEDB
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 05:08:45 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id AC5A33019BAA
	for <lists+linux-watchdog@lfdr.de>; Wed, 28 Jan 2026 04:08:20 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id AA69F2DB7B4;
	Wed, 28 Jan 2026 04:08:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="VKkmHZa7"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ej1-f50.google.com (mail-ej1-f50.google.com [209.85.218.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 06CAE32ED2C
	for <linux-watchdog@vger.kernel.org>; Wed, 28 Jan 2026 04:08:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769573299; cv=none; b=i64MJjN40hbxmk34lBoGpCz0VVT951lTGUQEhAmn42Vzt15z9Fg0xQ5YKY5Odw9B2dRr36AasB5zztiXch6MFNPdpuVgCa4QEAJ9+QMPCGCO4O2i23PJV77yyzbyfLiux5SpUTbb7xdTN+gnwdbL3fphY719bncRZYrA4f8T6FY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769573299; c=relaxed/simple;
	bh=IKS3rm5HaKGj1cSZc9Q9841iwotUmP6mNanLxQbk4Us=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=atxWVbkpr0zZtWePoHnY8uuAOhQLrqtG3ikJIUs6kxOOdGd2ly2tBZSl3DJ1CU3JP6pt/735leEFey++4Vhx44foBtXJkYdNLUNxF5JPqmJhABEkp5l9ksQdi6LvNVmkrNPkCEXr6OWHP+9nepMJzVLVtR/PWOz8COfSJfenjBc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=VKkmHZa7; arc=none smtp.client-ip=209.85.218.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Received: by mail-ej1-f50.google.com with SMTP id a640c23a62f3a-b8845cb580bso1135525566b.3
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 20:08:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1769573293; x=1770178093; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=E+SBx2bhyAxpOr0xPAhvkbF9K+DXCdj305biHMr2LWg=;
        b=VKkmHZa7+qD/9ioUm7My3/ECcIJ40G98857Nv9A9zAQJQm1wZ946afSlImRZ5ElmSx
         LGXEoqLoSCKxk/2+7mx/MnPT9LIs3iKjTIZpsQDalRNY3RF10UD0bVfKs2EZw3KKdjTi
         tSHPwUYxbUvLxpkfp1p1+Avs7Mm0S3n/o/BPU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1769573293; x=1770178093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=E+SBx2bhyAxpOr0xPAhvkbF9K+DXCdj305biHMr2LWg=;
        b=EMjHlPNA5SfA4gmV26Sz76yWS+3tjDvFG6B2Aq1hP2K6zGu/knVDba2WMXOw+7Ax2n
         zQlbmZvcUEK0H3/PkRFQfvdmOJ8c65CnhaILwnJfpalxYGO8cgRTXaYe9CRPcrnnTRqt
         HjJ0mjQJ/5kIkqiD70gqjxF3AiAYCrn2XXehhwN6nKwV21OrrC9dXBNTsNZh/+f2Bq8w
         ITdc2Aw8I9Cvq+9K1y8H++UNekjQ5VEGR7lXriIuPxLCKMl287OfPyjvddHpHP3wGiLN
         B0dkE1COxSyDCWuSXI/RmwnC8YnoBLEiNHvgQF+/BijVqwTt5Qt5Lzk512GT2itUZpp8
         eJpQ==
X-Forwarded-Encrypted: i=1; AJvYcCXvmj2QeZ6Ma+PYCxErwC9U0nN6W/+p0mqhPpU3v0wAX/V9kv3U1Uu7AYs4TS4nMOc7SpcmVxijPpsUfMiLBg==@vger.kernel.org
X-Gm-Message-State: AOJu0YyCKQa3UnbB6gbVuyGav4dSQash9nfDmhPooeT3macuQd1Ji+vf
	njpxno59l9+k33UxLEw5/B12istNsNT35ZrxCae52TeCb95JPa/X/cEFpFF8OrpDntrEQ660Lro
	/ZzZsTURp
X-Gm-Gg: AZuq6aKJNyaVmSyOcbfCogn4bqomwIgBDbDE4YWaDCavSdm1zyGs+6Jy1F/1twkj4nv
	tv73H8KjBg1A1c76o3FS0p/FbfLXABgvhIq0Zw9+nhLMvM3t80y7ztNf/By+0fEbxMdAUK/p3Y1
	r6viOT2WspiBfc+NlFz75mrjscn/7qBUkszOHVL5+1jKNpIlIJTfwppRU4AgE57DCs/AdfwRp2L
	1DxhmGx0z+6aClm8pXkSb5AiteC06KENjGf1hCwKw+6syXtT1qeUP3Z8TluLiYQlrafh7Q+CFow
	Ozpk8Eptii2hloIjDFHw1Py26iShJdjqrOIUzCQyMoCSTp6OZm90BbeyNy5CltElR5BkQP50gL9
	iY/ij8qnWYpw8tDEzf5PPdnilfulKI2eh6xdTT1oFYoAzy4QXcSjho4x1ZPky300xcxTnklOyfp
	LxaE65lFM4gVgoogABBQX5s8rVHdMlFLFhWAffSryqR60BMvJD0w==
X-Received: by 2002:a17:907:97c7:b0:b87:117f:b6f9 with SMTP id a640c23a62f3a-b8dab15b335mr273953066b.8.1769573293098;
        Tue, 27 Jan 2026 20:08:13 -0800 (PST)
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com. [209.85.221.52])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b8dbefc5ddbsm70224366b.18.2026.01.27.20.08.11
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Jan 2026 20:08:12 -0800 (PST)
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-435a517be33so3927557f8f.0
        for <linux-watchdog@vger.kernel.org>; Tue, 27 Jan 2026 20:08:11 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCXfrkA0aurOFj4CXIxcYOzry4q8SBRCM3XcHImiZMoM9t5iAr/z48aRU1Sy7quFBcMXmG88IDN5Ql/Nv2ZRPw==@vger.kernel.org
X-Received: by 2002:a05:6000:25c6:b0:429:b751:7935 with SMTP id
 ffacd0b85a97d-435dd1d7c61mr4787319f8f.56.1769573291404; Tue, 27 Jan 2026
 20:08:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260128023136.1691973-1-realwujing@gmail.com>
In-Reply-To: <20260128023136.1691973-1-realwujing@gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Tue, 27 Jan 2026 20:08:00 -0800
X-Gmail-Original-Message-ID: <CAD=FV=XX0dJ2jEaQ21M4Kas6pbJL0SSCxYhr8-1kqSTEiJP_UA@mail.gmail.com>
X-Gm-Features: AZwV_QgdeU-M1S25dbD0bfuUkv4_GToYEVkAE_Sry3IUpeS5khRlkZo5Q_oaJ0E
Message-ID: <CAD=FV=XX0dJ2jEaQ21M4Kas6pbJL0SSCxYhr8-1kqSTEiJP_UA@mail.gmail.com>
Subject: Re: [PATCH v6] watchdog/hardlockup: simplify perf event probe and
 remove per-cpu dependency
To: Qiliang Yuan <realwujing@gmail.com>
Cc: Li Huafei <lihuafei1@huawei.com>, Andrew Morton <akpm@linux-foundation.org>, 
	Ingo Molnar <mingo@kernel.org>, Jinchao Wang <wangjinchao600@gmail.com>, 
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
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[chromium.org:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[bounces-4838-lists,linux-watchdog=lfdr.de];
	FREEMAIL_TO(0.00)[gmail.com];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_CC(0.00)[huawei.com,linux-foundation.org,kernel.org,gmail.com,hisilicon.com,linux.dev,vger.kernel.org,chinatelecom.cn];
	RCPT_COUNT_TWELVE(0.00)[14];
	MIME_TRACE(0.00)[0:+];
	FROM_HAS_DN(0.00)[];
	MISSING_XM_UA(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[dianders@chromium.org,linux-watchdog@vger.kernel.org];
	DKIM_TRACE(0.00)[chromium.org:+];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TAGGED_RCPT(0.00)[linux-watchdog];
	TO_DN_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns,chinatelecom.cn:email,mail.gmail.com:mid]
X-Rspamd-Queue-Id: D7DB29CEDB
X-Rspamd-Action: no action

Hi,

On Tue, Jan 27, 2026 at 6:32=E2=80=AFPM Qiliang Yuan <realwujing@gmail.com>=
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
> Use cpu_hotplug_disable() during the probe to ensure the target CPU
> remains stable throughout the availability check.
>
> Signed-off-by: Shouxin Sun <sunshx@chinatelecom.cn>
> Signed-off-by: Junnan Zhang <zhangjn11@chinatelecom.cn>
> Signed-off-by: Qiliang Yuan <yuanql9@chinatelecom.cn>
> Cc: Song Liu <song@kernel.org>
> Cc: Douglas Anderson <dianders@chromium.org>
> Cc: Jinchao Wang <wangjinchao600@gmail.com>

One last note is that your Signed-off-by tags don't match. When I
apply your patch, I see:

Author:     Qiliang Yuan <realwujing@gmail.com>

...but your Signed-off-by is your "@chinatelecom.cn" address. That's
generally not okay. You need to do something to make those match. My
guess is that locally you're using git-send-email and everything looks
good on your end, but then you use your gmail account to login to a
SMTP server to send your patch. Gmail silently rewrites your patch to
be sent from the Gmail address you logged in with.

You'll need to work on your email setup to fix that. Andrew can
correct me if I'm wrong, but I think he can't really commit your patch
until you've resent it with that fix.


> @@ -263,19 +259,35 @@ bool __weak __init arch_perf_nmi_is_available(void)
>   */
>  int __init watchdog_hardlockup_probe(void)
>  {
> +       struct perf_event *evt;
> +       unsigned int cpu;
>         int ret;
>
>         if (!arch_perf_nmi_is_available())
>                 return -ENODEV;
>
> -       ret =3D hardlockup_detector_event_create();
> +       if (!hw_nmi_get_sample_period(watchdog_thresh))
> +               return -EINVAL;
>
> -       if (ret) {
> +       /*
> +        * Test hardware PMU availability by creating a temporary perf ev=
ent.
> +        * The requested CPU is arbitrary; preemption is not disabled, so
> +        * raw_smp_processor_id() is used. Surround with cpu_hotplug_disa=
ble()
> +        * to ensure the arbitrarily chosen CPU remains online during the=
 check.
> +        * The event is released immediately.
> +        */
> +       cpu_hotplug_disable();

Given our newest understanding, the cpu_hotplug_disable() isn't truly
needed anymore, but I'm still good keeping it. Perhaps we can
eventually make the caller not need to queue the work on the system
workqueue.

With your Signed-off-by fixed, I'd be happy with:

Reviewed-by: Douglas Anderson <dianders@chromium.org>

NOTE: I am not currently set up to test this patch (either through the
main probe path or the retry path) so I haven't personally validated
it. That being said, the code looks right to me. :-P

-Doug


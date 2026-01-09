Return-Path: <linux-watchdog+bounces-4775-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id C6544D07993
	for <lists+linux-watchdog@lfdr.de>; Fri, 09 Jan 2026 08:34:47 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 738453025178
	for <lists+linux-watchdog@lfdr.de>; Fri,  9 Jan 2026 07:34:41 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 1D12F28642D;
	Fri,  9 Jan 2026 07:34:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="fNoWH1a4"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ot1-f44.google.com (mail-ot1-f44.google.com [209.85.210.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8E79E2EBDE9
	for <linux-watchdog@vger.kernel.org>; Fri,  9 Jan 2026 07:34:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767944081; cv=none; b=XTzf98drw5PYKOB5DsBvRQMZPCJu2mrr1d4szOi1CeAXe/4D9DIOWwWVJ68WIZhfNpomUE2MbjCKpaGmrO7ceeHvFTjvzIwDaa6Ac9h9DwWFu4Uu/EyooOzVCqo1EnA3S4N9akeKIwCdXkUh27aCT7jTuNljURxluOc1N3AQ1k4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767944081; c=relaxed/simple;
	bh=7tR/ZYbxwRw31VQ7G4Drgo0EN5v/lLxJEOFU8+T/Whk=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=uVF630bO68zH/Om7mTG2fh7uwa2lcwdIRyaLcKENmUGLu70gSlTYG0CkR/5yj4sbv2v+kU244X1H/6FPYp9uwtoJ41aFBN35gHBIMObeNm3fpTXNPvjM3j6M6PLWFVov1RGJiDxNDWhyuwiNUBE2zC+h3mL9NarN0kyTtb5FBWU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=fNoWH1a4; arc=none smtp.client-ip=209.85.210.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Received: by mail-ot1-f44.google.com with SMTP id 46e09a7af769-7cae2330765so1923300a34.0
        for <linux-watchdog@vger.kernel.org>; Thu, 08 Jan 2026 23:34:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767944078; x=1768548878; darn=vger.kernel.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=CvruJf9ds6VF4vKwIEOtxb71AX3Ha61J6CEY4Eo+Z88=;
        b=fNoWH1a4/6vyIkp81bk//tnxkvekqel+3dVeaK8aG9Z+KZkXZ+9hYv2UyDgFKceIU+
         x5AjrijR3Ru9v5njY+614IKEDrRHLPn/ETzoNv1GS/2U48JJICoi7nmR2swzDaFiMrMq
         Wm5yehTgxj6Sm3QEXkp847VoLwFncfpCobyMUtvIKdKwSyeQowBgo8EDI5UakXFl9J+S
         pUU7ats5+7T2Db5TvOjE0B4xfU5CsseWX0bzx+RjCzAZAkCCb/5tGQU81alyqT7Jr0Sk
         ULTBDeXh/gCnchsLwTCoy1e73ylTmAoCgKFbQEtsa/BaGoajAo13ZRVd1+oOKtH6dWTr
         CTYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767944078; x=1768548878;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=CvruJf9ds6VF4vKwIEOtxb71AX3Ha61J6CEY4Eo+Z88=;
        b=r5qZPRvDLbSdR+ZjWNyOTAeY3/AizQBpyW55BgoX9s4pCVY9TXj/EyqS0yFNStoey+
         KBLh8bY/b/Ck6zeV61LA/0TZ3JINE18zg4gvoqDYKbrCw8nw1Y2LW6PjlPYiGE6QIh7A
         fuTpn8OKjB/XC9+iwtkd0VHQiEY0Nti1IrnbTfJpt27COk6+DGDW6Vmkj7TuYK3ua/bt
         cAHvfQML79OYJWASiljNOtxb8jpzqVTQ2kI1+qM9TV37Y09F7uYZIMoh1TxGVKXtoTts
         8i5vbwv2hglg5ZJqA8ZcMhD63dP2/EPZFRA/bF8HuCJIeNSgzMpOj/ROy0rjDIDvsBV0
         rJ+w==
X-Forwarded-Encrypted: i=1; AJvYcCXrkV/mtx5Q9a1+5gpTT4JBChNWH4VthP4EFcftl5lt0XHDkJcYxfkJKWJW4G97ZSUuiNxXwrEh+XhOX8zZFQ==@vger.kernel.org
X-Gm-Message-State: AOJu0YzzOXHP08y46pW+WhIIneoESAFITcP7HX4BBq7o27DAKdORj6AD
	oYX9XbDlpgk9ECXckDvVQnaIuzIzGbrBQg1mB0YJnQ+q9iCp6W6S7Ep5+CrVPKGDr9BhsLIv1t3
	KXyReKB6ecz6HW5bIrv7Nxd82BsJCN+c3objI/YJdUa3hSHJ8twqekGN5
X-Gm-Gg: AY/fxX4SKX4dx249Mc9+yqI79u/TnS3T8vGCIjYC5Emi+GYEKoKvj+5nYNODgvy4O0Z
	3Xm2Pin7bMs025zbzpLObfgtcyP/XBbFc9Q9+pNzBaWhF2sA6NSqfsV6ITWXhXCPhYgt/IgTkTc
	Itrc9BGj1pTGKpCXOgNqXKajj/+6mU7z2Kh/DowXjEnyGe9Wq8L7+aX+xPCjTkI32Cu+7MbGXyk
	STBlnvvEkXR0m/JnYWDAlB+CaySOoVWpJXUvGcfPvzlxWGWkz5YGiMJZFD1+j4vRMBB8/hw02aD
	fcJTBiFYFFcQmW58D4XlGwSVgJPTRQE/IvgGICsqqzse+70Ki5sBQrU4Cg==
X-Google-Smtp-Source: AGHT+IGnOY8cHaoSa8refvi55GtPBbWuAyzTCPpLjqQpuU09TO6GLYmPj8KwpI8kHIMdXLmZUr0kmdfCe6CJYJWRqIA=
X-Received: by 2002:a05:6820:660e:b0:65d:1ec0:2fe5 with SMTP id
 006d021491bc7-65f545b3316mr3376567eaf.1.1767944078298; Thu, 08 Jan 2026
 23:34:38 -0800 (PST)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <409c49ef.ab91.19b9b835c62.Coremail.23009200614@stu.xidian.edu.cn> <4be6759d-091f-428c-a514-fec465cf053e@roeck-us.net>
In-Reply-To: <4be6759d-091f-428c-a514-fec465cf053e@roeck-us.net>
From: Aleksandr Nogikh <nogikh@google.com>
Date: Fri, 9 Jan 2026 08:34:27 +0100
X-Gm-Features: AQt7F2ogUyK0omYd-6DMkF5g_NsUVcwXb9vaiTqCU2aU3O6OcWmx0QxEZSaRjTA
Message-ID: <CANp29Y5OvPgU7y6OftDtk=jhraJDJyDb3=DEBcOk9T9B99kcVg@mail.gmail.com>
Subject: Re: [syzbot] Kernel panic in pcipcwd_get_status due to simulated overheat
To: Guenter Roeck <linux@roeck-us.net>
Cc: =?UTF-8?B?546L5b+X?= <23009200614@stu.xidian.edu.cn>, 
	linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
	syzkaller-bugs@googlegroups.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Thu, Jan 8, 2026 at 5:18=E2=80=AFPM Guenter Roeck <linux@roeck-us.net> w=
rote:
>
> On Thu, Jan 08, 2026 at 10:50:35AM +0800, =E7=8E=8B=E5=BF=97 wrote:
> > syzbot has found the following issue on:
> >
> > HEAD commit:    6.18.0 (custom build)
> > git tree:       linux-stable
> > console output: (see below)
> > kernel config:  (attached)
> >
> > ---
> >
> > pcwd_pci: Card timer not enabled
> > pcwd_pci: Unexpected close, not stopping watchdog!
> > pcwd_pci: Card timer not enabled
> > pcwd_pci: Unexpected close, not stopping watchdog!
> > pcwd_pci: Card timer not enabled
> > Kernel panic - not syncing: pcwd_pci: Temperature overheat trip!
>
> You mean syzbot now complains that a driver is doing exactly what
> it is supposed to be doing ? Really ?
>
> It is not surprising that more and more people consider syzbot reports
> to be just noise.

Please note that it was not a report from syzbot itself.

>
> Guenter
>


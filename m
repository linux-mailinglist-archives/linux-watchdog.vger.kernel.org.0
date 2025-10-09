Return-Path: <linux-watchdog+bounces-4367-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from dfw.mirrors.kernel.org (dfw.mirrors.kernel.org [142.0.200.124])
	by mail.lfdr.de (Postfix) with ESMTPS id F0DE7BC9278
	for <lists+linux-watchdog@lfdr.de>; Thu, 09 Oct 2025 15:00:42 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.mirrors.kernel.org (Postfix) with ESMTPS id EC0004E3D84
	for <lists+linux-watchdog@lfdr.de>; Thu,  9 Oct 2025 13:00:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7EB372C326E;
	Thu,  9 Oct 2025 13:00:33 +0000 (UTC)
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-ua1-f46.google.com (mail-ua1-f46.google.com [209.85.222.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32B1111713
	for <linux-watchdog@vger.kernel.org>; Thu,  9 Oct 2025 13:00:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760014833; cv=none; b=s8aHeD7JX+LVsE0x5URhdqxyr8QKDkcjHIC9sXwGLgIAGvv5LYBVkJ462MW81X1cGmFBTcRlXB/MowjE1qTTUOij9HoW9WmHl5OD3GU58BZvxpDl3nEJlnRKJcgOh3OPiN+qI78yXNAi5hQ6vxcw35t8pBt4bFSGlH2a8PWEYEE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760014833; c=relaxed/simple;
	bh=6u3hExo8BaFPYnHeuKnQj7DLSLZp25d6G7VihlvHxCc=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=YePurZ8YQSuJOeLgsShgwwWVys7Riat0GEv1GAjWRbN/3sDWnjaYjSJO+qyKd6xKKZAdqAwZXyHpVPX2NW2PDT+sI8I7/MEXwM/FDnqX2m6P3ZEMHM2faBSEw+pFe6fjfBafSKhMuXZE0PzMtb7RTsMArjpDnvMUKcuGdSnNmqs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org; spf=pass smtp.mailfrom=gmail.com; arc=none smtp.client-ip=209.85.222.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=linux-m68k.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-ua1-f46.google.com with SMTP id a1e0cc1a2514c-8e8163d94bbso765940241.3
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Oct 2025 06:00:30 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760014830; x=1760619630;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=eotha7xWzuEbV2GrcE4HgLJOI5Q7DNyYVipBin0aoCQ=;
        b=MWjQphI3wdLABXAamwlc9IbajsDrI13sapvisfh+dnIxElXs1CfLQ5AoOY1jchHyAA
         vXUiyqhwB5sRD+n4ptLVQsbwXMxbBXcsemU0zzo0PhYAGfYUCaOmpykBxc2LwKXHY3eb
         gQKsBVdyOviAmTXiT5VqpbVHKLWAVS7i3aHKxvVSm7p4ZhmGxGYgwTQVYjTqhAAEKJ6T
         8+8M8ooeo6TNhDOOYrslTtWRs8Kao393aE+wBX6A9kravdZktIgA6cM5GSeoCRatOEXV
         ldXqlMHRDXjYjFFMkNYKUNLJyj9uVPQF5fnSLKtTxc2ZzQq1sXYsYcsxmRqnO+NMjQ/X
         mTew==
X-Forwarded-Encrypted: i=1; AJvYcCXQBVijpZaEVY8fcM9OD4fHxjEQp+wa2i1PO/+pD0fzD9GGWbSGwBWZhVgpZ8a9I++v2Ys6loMfe6pve6VHeg==@vger.kernel.org
X-Gm-Message-State: AOJu0YzL9u6bx3/GZ9Pgfmsi6lDETGi7OAvIi8Cfp/64Fu9drjpjGqxY
	ADfrHBZswd2RNacFP0UsYqwWxvSV1U6WDsPQzB/XWeVPNsCsfnhm3ZNnUmMhSIvi
X-Gm-Gg: ASbGncsLAANwFYXGbna49xZiz/49krscETBegSSWWoOxnZULmTFFgi2zaKNusydDzIs
	g/bNWHYDRR9weHcLfrt+RZuNlG1Y87X5gcqzSXgBI09BV7PyOPO844PeRREauquw/WpqFAB+48x
	VuxXB3BaR/WAUhr95bSqtkAQcZ51bIBt4Tvm9pE8gRSlnVk0eoAGWqQsslMqGST/FSOX2HMITbi
	2Q/izKwUSK61EPIZfifrus4WmTcrU7SsnmZniZthMZzRniaOAxPhiJvPiSrEcQDvGE12G6uoZ5Z
	/8rtrVSPzL1ZLplEMmG+/ghi/dx3Dbqt3OcG+iwc39z9mXFHvvaZ5ZSiOmEQapBh8CgyYqfSwSv
	uiO5HFaR/ODFoJQDhl/h+cOdJuz73O2yAn8rAaRGhAAg7s3MFu3/0ejiVVw+AsK4GNqBdS7FVl/
	doTykL1fwKaTqHBnRZCxM=
X-Google-Smtp-Source: AGHT+IFYI6jbIN7mQq2PihAdEZb0QVFZvg7NjCi40BVnRmx27GhPCMQfmZdRXkHTFEoRNEP5S2IMwA==
X-Received: by 2002:a05:6102:c54:b0:5cd:3e41:48ff with SMTP id ada2fe7eead31-5d5e236b8a9mr2986701137.19.1760014829417;
        Thu, 09 Oct 2025 06:00:29 -0700 (PDT)
Received: from mail-ua1-f54.google.com (mail-ua1-f54.google.com. [209.85.222.54])
        by smtp.gmail.com with ESMTPSA id 71dfb90a1353d-5523ce69923sm5285941e0c.11.2025.10.09.06.00.29
        for <linux-watchdog@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 06:00:29 -0700 (PDT)
Received: by mail-ua1-f54.google.com with SMTP id a1e0cc1a2514c-8e8163d94bbso765898241.3
        for <linux-watchdog@vger.kernel.org>; Thu, 09 Oct 2025 06:00:29 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUsu7Cax0Ks+Dx62XXHcvYoxehyKssiTVv/WN8WRnMxCFuFRYeaGlgewbmSE3feBfqcTOUQgrAr+y9ZLHqUdQ==@vger.kernel.org
X-Received: by 2002:a05:6102:5ccc:b0:5b2:d28a:8937 with SMTP id
 ada2fe7eead31-5d5e226ab38mr3410054137.12.1760014827953; Thu, 09 Oct 2025
 06:00:27 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20251009104500.69787-7-wsa+renesas@sang-engineering.com> <20251009104500.69787-11-wsa+renesas@sang-engineering.com>
In-Reply-To: <20251009104500.69787-11-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 9 Oct 2025 15:00:16 +0200
X-Gmail-Original-Message-ID: <CAMuHMdWa275FOXW0esEPo40wXxy379XZfvv8DZ1Djj15v5BYsw@mail.gmail.com>
X-Gm-Features: AS18NWCp4Dgt694yDYCJKQXwRm4FIe-wfRRX6CYajTay2WubO0THp0YFg2rjuFQ
Message-ID: <CAMuHMdWa275FOXW0esEPo40wXxy379XZfvv8DZ1Djj15v5BYsw@mail.gmail.com>
Subject: Re: [PATCH v4 4/5] dt-bindings: watchdog: factor out RZ/V2H(P) watchdog
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org, Guenter Roeck <linux@roeck-us.net>, 
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>, 
	"Rob Herring (Arm)" <robh@kernel.org>, Wim Van Sebroeck <wim@linux-watchdog.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Magnus Damm <magnus.damm@gmail.com>, linux-watchdog@vger.kernel.org, 
	devicetree@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Thu, 9 Oct 2025 at 12:45, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Renesas created different watchdog IPs but they are all handled in the
> same binding documentation. This leads to a lot of conditional handling
> which makes it unnecessarily hard to add new items. Factor out the
> RZ/V2H(P) watchdog to make handling easier.
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>
> Reviewed-by: Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
> Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Changes since v3:
> * added tags from Rob (Thanks!)
> * merged the two if-conditions (Geert)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds


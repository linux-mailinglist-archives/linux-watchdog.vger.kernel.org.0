Return-Path: <linux-watchdog+bounces-3997-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from ny.mirrors.kernel.org (ny.mirrors.kernel.org [IPv6:2604:1380:45d1:ec00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E5682B2925D
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Aug 2025 11:00:08 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by ny.mirrors.kernel.org (Postfix) with ESMTPS id E3D782A0F73
	for <lists+linux-watchdog@lfdr.de>; Sun, 17 Aug 2025 09:00:08 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id B6ED72222C3;
	Sun, 17 Aug 2025 09:00:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="ATz8DR95"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-vk1-f178.google.com (mail-vk1-f178.google.com [209.85.221.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2B3CB221F2D
	for <linux-watchdog@vger.kernel.org>; Sun, 17 Aug 2025 09:00:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755421206; cv=none; b=sXnmqA/UxVDu8TaaiS8pMuBYk8BnB6vee8Br5oghbgxAQ3WizKjy9vGSJgg5gt8ZZZrE6VOuAi9A8O03jwsCc74KsNahytG3Mc+54HFk0kQi5brOY7+fPTK14RqmALGc9PcQpU6nO18ia8ufG5tI+bAsNaZ//jeL9iwym9FoeQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755421206; c=relaxed/simple;
	bh=uZ5hszxPt7eNl/wmtnrB03nVXHTXQmo4M68QI3ZLvjw=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=Sz2tF2B4ypUNN3Js3ORJr4kkuWjloa8RQW5jj3G7nvvbkK9FG4hqYFUwY8hitVKqNkD3Sg5xGjLa9u+jYIbKB5ksedrasG67im+H5zH57hYyNKsslntvS/J1/vgXp06o/CrITObRiGes3vWEQsdd9lTuHJEbxV2efpIixiX6dZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=ATz8DR95; arc=none smtp.client-ip=209.85.221.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-vk1-f178.google.com with SMTP id 71dfb90a1353d-53b174c9c79so1425923e0c.2
        for <linux-watchdog@vger.kernel.org>; Sun, 17 Aug 2025 02:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755421204; x=1756026004; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uZ5hszxPt7eNl/wmtnrB03nVXHTXQmo4M68QI3ZLvjw=;
        b=ATz8DR95eRlhJpa3nmM5cv12KcifoOQe8eAeWSl6kfmI/ExcIz0eMftevXJM15N4sY
         77KNiyadDUzqegTLUN23dMXuezliNey6fcKUrPmUocCMm52Ie0Vop4ZwQj8AdcTasHlo
         Pdr6YOI5geU+I1QT9sAlu4MRmtXLi+eXupIJes1lh2oZ0w/6pwq3dNeGpZZ7vQpv9J4k
         LIDXsdhymi7E9/sHB7vmPG2TXPkrOKLEUTDZS8xnJbXQPxNgEvqjrLxKy6O3ZcKFoqMe
         0kO7PvpkArvE/BNV4ru+xSMXvtiZ8wEwqOjfkBQjge8Jc1kSTz9fd3NRGq5bUm1qyJJA
         aIgg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755421204; x=1756026004;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uZ5hszxPt7eNl/wmtnrB03nVXHTXQmo4M68QI3ZLvjw=;
        b=k8nej9aZbxTvS78BCVx98Ed2vnzTdZaFtKoJ7OEPMe/MtYesjxtgfWdm5etHY8odjy
         N/gonyjR6vNSsb2kzt56eMaZ3H2VJeBEdL43tty+5MvRPrMZ/a3jla7CriKO3Yyqh9nx
         +l1itR+snflyGvTzCNQB7DhDzCZTY17aTOfGm0szXZ1Yz+UCvKbtTOo5zNNUNwHhvkRd
         o0DdkHsVCZ2F3zcyF8w8VzwIf1P25cyzRfzPAeZBqPHyOGNyt7EvFSzoukPYFX2BYb3c
         Md090hQDwQzCkvaIuPTvu5kaEdaLap7GAzon+V2OyyTG7oG/HDe/lHLuRf39nhhMwpwt
         LQGA==
X-Gm-Message-State: AOJu0YzEEH/J3XmLpsR4T9ABnGl2fJtVphXiU4RUy4F/w/VzcP0xZt1l
	K+80oy1efbT8CAoJjoJUIEClHuStTSTWzwjU5k0fHcs3BnfobwZfvMlNZPpiduA2lcYHD0y6mj8
	BsqruIl+dCzwz/h8jElw67OUU0i+dFgJEq9IF2n4=
X-Gm-Gg: ASbGnctZ/C+Zdl4GeO70+/qWGAwH+EGdt8lDbA4A/XQjNQhoUE8u06suQEMXJOqteZH
	ZkBSS+3p8G/Y32v/lpjNYl6nAXqCJZRdoetPmjyinMuy5fcinTz5yyWX2vD6IaO7ZpXYBL9ZCIg
	OrLmA9uYHOnlq4Go8gf+Cmgiu3+6ATqXCKb0myMXyPe7KLp0FCuDIAIcsICWFdLHFgfWNphDXbK
	0b1DKE=
X-Google-Smtp-Source: AGHT+IGRisQnHLXGUwhzR3Q/oPo7YJuflgWRCGVevUDfhluUP52ldTkVWY9bpH4f0SXnQ2zhXxEIKh5ns28PLp1g5dA=
X-Received: by 2002:a05:6122:925:b0:539:1142:21a1 with SMTP id
 71dfb90a1353d-53b2b631130mr2422490e0c.0.1755421204030; Sun, 17 Aug 2025
 02:00:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: =?UTF-8?B?UGV0YXIgS3VsacSH?= <cooleech@gmail.com>
Date: Sun, 17 Aug 2025 10:59:52 +0200
X-Gm-Features: Ac12FXzWzSIH0EYx1GoZEkdcqPgAynV_KXNAJw14C-eURkCD49gIwdRDVH4WQ_8
Message-ID: <CAFbNFpBY-wrxjD0h8hjGnHFirn35kWfW-ucoX-wAVmR5SHjARg@mail.gmail.com>
Subject: Bug with intel_oc_wdt kernel module
To: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi,

as I was pointed out in this thread:

bbs.archlinux.org/viewtopic.php?pid=2256738

... I'd like to report a bug that prevents me from fully booting my
Arch Linux install unless I blacklist this module.

My config is as follows:

OS: Arch Linux x86_64
Host: HP EliteDesk 800 G1 USDT
Kernel: Linux 6.16.1-arch1-1
DE: KDE Plasma 6.4.4
WM: KWin (Wayland)
CPU: Intel(R) Core(TM) i5-4590S (4) @ 3.70 GHz
GPU: Intel Xeon E3-1200 v3/4th Gen Core Processor Integrat]

Problem started after I updated my system with pacman -Syu and kernel
got updated from 6.15.9 to 6.16. Same problem exists in 6.16.1 kernel,
but as I've already stated, once I blacklist intel_oc_wdt all works
just fine.
Let me know if you need any more info.

Thank you.

Petar


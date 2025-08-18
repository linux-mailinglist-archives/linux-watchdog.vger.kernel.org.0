Return-Path: <linux-watchdog+bounces-4010-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 8C2F0B2AF17
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 19:13:28 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id 0EBC87B1875
	for <lists+linux-watchdog@lfdr.de>; Mon, 18 Aug 2025 17:11:49 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 34CA51B5EC8;
	Mon, 18 Aug 2025 17:13:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AbuoUKYK"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8A59832C309
	for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 17:13:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1755537190; cv=none; b=esF1Tbi+odbj7kILn+t+BxBfo+4XSBzv+z2f9QQZPqjNGSXD2zkOtrQD/KvMecAzmZPVLnaY+ic28FGj8of0+0wMxis7DEEk5hi8gkZmacge0GE017ONQwynqpFaGoT4g21NcMFiJ295GY5ie3Pl9TghGv/JUhwcsH9KZGiFE6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1755537190; c=relaxed/simple;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Content-Type; b=kK6uwkp6pUrlW+K7s2AydlOULza+yP5ugAA3k3DYMzy/QfFvCEE2o63B5BZpfkbD5wGwLYqaij9qvFmbAlkvMYYnN1Ia8iuaN9OD7VRLzUPCFN/DOPhom79e1q57yDhUAvt8RDNqi4t+P3q5vA6aGMp1lwS5Lgy1CH6sfJDlVug=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AbuoUKYK; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-333f8d1cbcdso36733361fa.0
        for <linux-watchdog@vger.kernel.org>; Mon, 18 Aug 2025 10:13:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1755537185; x=1756141985; darn=vger.kernel.org;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=AbuoUKYKrkW1Ia3ojg2+Xl7fL+m8LgzTbVeSdg00QAM2kqgrwdi4EygFcqA+RtQvjg
         uvB5KthspGgyP5tCEQPSmDUXLCYm9bh8wthCzBUNzdCst/swwsGVq3WpNDv2vZDzO7zL
         nvio0Ryx5ybwqg2tJzDMIHTJuMOl53884jAxkMOdrTm2845PKNyhWuSR/Rc+gvxfuj6J
         jfbHq4bBnm1Jqe1N1D99Dg2rU+uOrVR0W5WqaLYqL5a9RCPIK8RAjyjswzinIQcMgTRp
         fmIAVs7t7N8M2gXAHroX9v4uE6yd5MThSHrFH8B31aCCjcbYynu4UyU66Mn95cHwZIEu
         3C/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1755537185; x=1756141985;
        h=to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
        b=tj+Db0ZxQTLJ353H9TJ2wXAkWm/sTQx7/WgqAMtnceEubMcrLMN6GvljBI9LuuuuKF
         pqL1TZL5/cUyUsehIjCUU1clI2sjeQPkoggAnVheyvVSA7X42u4aZJrcmHtnnlMUf7D9
         at9mQbEmbxLDyokP8tmL+MHWX3Vohe7AGxzwqzShoG32hIsexDdtEFVOio3WvHrfbkgN
         9TnF0xIkR8PRGF3t29KSMIN2uvUj3TwKfa5LBkJSFCy/NhrweCAft2JHiIEed4ZmYQKB
         bIDP2G3JpTf979UUKqUTqrKmfsNkmYkSWfRl0zfby1mO9Kx2UAlKt8wZdfb8R+dsOayy
         EMaQ==
X-Gm-Message-State: AOJu0YxyRc9WIOtJzS86pW4F9p+1zmww87rRgzCRsI69+iUHjvItU0cc
	c6mkHM58Gy+JUVdTeJd6WUqhojABL47rh0C6ZBCUO9qUMm8hv5HSoi3Jtu1O6MXGFQA9NTqQ8UW
	5kyNCVRdv3T+MvCkWcPZe7TWzMr0APUcsEQ==
X-Gm-Gg: ASbGncu1g6qEZZUa4HsCk3kDkL3L1O/+s3T4tHoje8Zyzc+lO05CtHXyn8dHfI+ftYo
	43LfnyZYP+tV3nmUT2wn6DGBAXSbRsMOYRzkMaOhbspwphZ8LNuGMVFlqjL6n6Prb327DutgcfX
	Hkwvkz/jr7ZWIpHF+Z3oea7O7Ae6mc4py2/vA9yPVTl5Hc2iQCgf2Xl2FONv3+mNi0FJxY35BmY
	ti+6QUoiN6qh5yBTfp+dZ/bPznfQzsN8os28VYTXFLMdvDDh1w8
X-Google-Smtp-Source: AGHT+IEmLrIQ1USh78p/2HLnNsKCt7viEbq6vQUt/dgok5TRjn7phWnAGmldlS9fcoc+C7UFdxiU3/0slg/w30bCWR4=
X-Received: by 2002:a2e:9d92:0:b0:32b:2fe7:afd0 with SMTP id
 38308e7fff4ca-3340982b932mr24924051fa.17.1755537184994; Mon, 18 Aug 2025
 10:13:04 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
From: Akshay Jindal <akshayaj.lkd@gmail.com>
Date: Mon, 18 Aug 2025 22:42:52 +0530
X-Gm-Features: Ac12FXyugs7SC9FqO9lvUY4baiXczq6pAGFXcuXs_j4CP1yo64LrPDO9RwvA1fg
Message-ID: <CAE3SzaQ+ReWSr1auAU1ko015-HnZhvXEjGb-_H=zPqia-nGe9Q@mail.gmail.com>
Subject: unsubscribe watchdog
To: linux-watchdog@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"




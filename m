Return-Path: <linux-watchdog+bounces-1397-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from am.mirrors.kernel.org (am.mirrors.kernel.org [147.75.80.249])
	by mail.lfdr.de (Postfix) with ESMTPS id 1E14493200D
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 07:29:53 +0200 (CEST)
Received: from smtp.subspace.kernel.org (wormhole.subspace.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by am.mirrors.kernel.org (Postfix) with ESMTPS id 791431F21DA2
	for <lists+linux-watchdog@lfdr.de>; Tue, 16 Jul 2024 05:29:52 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4AF9A10A11;
	Tue, 16 Jul 2024 05:29:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="mTEZ8Bdo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mail-pg1-f182.google.com (mail-pg1-f182.google.com [209.85.215.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62CCF14265;
	Tue, 16 Jul 2024 05:29:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721107789; cv=none; b=EklI/rsaoAE8lSSW7CAB/e7VYgFHvcTcYjwxU97CfcyA04bof+JQu1hYDmG9QXRj51bejFTAbjsRXebnZ4paYZLwHp6IuepnTk8vNEfzgVVjOEQF/paRENofjGK98OMUp+URzYI9C+IBw5Im12Sla+m6taWRtMWf3b4eBaGza60=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721107789; c=relaxed/simple;
	bh=e46U/DiNcyi7HDcA3Cujr0BhJ99xGXxALF0PWvE10d4=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Gl65yaPoAfEjwdiiGNBvLdqdYBJz9KWAXjPVndP5gjAyjAP0EHV7qNOy+pBdA7IgTJj30PtuhbK7A6lBPl3ZO4LV5+m/aMjmWemkylr02h0U5/1TzMmWYbuMUrZWa+bQIyjpFMqBFfUh7iwemWcVDA4r8Zp+nbbcQ4VPg97bW2E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=mTEZ8Bdo; arc=none smtp.client-ip=209.85.215.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=roeck-us.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Received: by mail-pg1-f182.google.com with SMTP id 41be03b00d2f7-793a3a79a83so975242a12.3;
        Mon, 15 Jul 2024 22:29:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1721107787; x=1721712587; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:from:to:cc:subject:date:message-id:reply-to;
        bh=T05ApqdVkEZV4zjLsrh5xHJajwEHetva8Vcp3aNTwkM=;
        b=mTEZ8BdoDJWS5UiuFXRDJ/RP458KQhEp3jei6XRUf2dSCZsuFfSorVev9A8Qw9B+gV
         3U8Cr0kI+b5GC4jP442D3iblnOAHl0goJEARWDPCtNweN+T0drOsxZ9xwJ1R4zWbx40l
         ntSFgLQ21u/d0UafUeYua+UR/fnLU/INzz1XJjDtX+psb+MK7PdilK18kqI9lrm5cu9S
         J5qeLowtwZF108ZPQm2zKm2GE4sZUABnkJASbjf/3BRzjC872iROW5NQxeBC+U0Nk14s
         01P8gjXyGyBWEnOlHJp6zGS69jLX9f9pb9fHR0S35X2iFfyUqH0J5fJx0HHC1VhNdTe6
         O8JQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721107787; x=1721712587;
        h=content-transfer-encoding:in-reply-to:autocrypt:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:sender:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T05ApqdVkEZV4zjLsrh5xHJajwEHetva8Vcp3aNTwkM=;
        b=l+kw3DIvk2QW2T5rSp8Yyh+D5z13Wr08wt/dpQBXhgv9spdahpnL+E0YyYy5TkpwRE
         SPQOpXvdJoPP/wyhAZkOvLRKSuoyMZowaPilwUQEo48cVFDgaSmGXU1lN0VJRdlvyM4S
         Zr+fPXFSG17yy4MCZF/4Hu+8PuRSj+If6oH7pY5wOLTofTkU+P9nN+XQXZ3YZbG3wSJY
         u4XVaoJeRBfx+ngaZNI/oQRfwgZrpQo+UWKh+LlrBdza1bPyomVUw9EgJQcTDHfxjHeA
         EUq72FC0DP3+BN3P0ylw+dr96BXZx/P+iMV2bagGvtpm15sVEK9k7IVuLE2MxSHIYM0K
         tfQA==
X-Forwarded-Encrypted: i=1; AJvYcCWqdvksVxrIaLJJTysl20mLBC6s/O+cxf8R1UsF3Tk3nFIwiyjTn05Fe6XkeYTIeBwgwO57goc1DywTBENNitI//SVA06+2drYt8YY2
X-Gm-Message-State: AOJu0YxkGVYfXEFG/cTmTapHNJRE8QTh6IrlTqMWrI/d3QkzFlQb8UW3
	vJum+bSJ8L9WpIBgbKrq57tnm5RFk4xODUoxX67WPjwZq3fzct0P
X-Google-Smtp-Source: AGHT+IHHXbdTJjx/VzGhEYT4vlHxhEz8vfmGVnL6yFcBjAZ1WaSlHUsRoucaaKJBZQOmCfv7YeifEg==
X-Received: by 2002:a05:6a20:d50d:b0:1be:2e2e:5ae8 with SMTP id adf61e73a8af0-1c3f1274c64mr1208592637.40.1721107786563;
        Mon, 15 Jul 2024 22:29:46 -0700 (PDT)
Received: from ?IPV6:2600:1700:e321:62f0:329c:23ff:fee3:9d7c? ([2600:1700:e321:62f0:329c:23ff:fee3:9d7c])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fc0bc5f7c0sm49712555ad.307.2024.07.15.22.29.45
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 15 Jul 2024 22:29:45 -0700 (PDT)
Sender: Guenter Roeck <groeck7@gmail.com>
Message-ID: <464a6eca-e981-402b-a14c-61439d6fa4f2@roeck-us.net>
Date: Mon, 15 Jul 2024 22:29:44 -0700
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] watchdog: lenovo_se10_wdt: Convert comma to semicolon
To: Chen Ni <nichen@iscas.ac.cn>, wim@linux-watchdog.org,
 mpearson-lenovo@squebb.ca, dober@lenovo.com
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20240716030725.400400-1-nichen@iscas.ac.cn>
Content-Language: en-US
From: Guenter Roeck <linux@roeck-us.net>
Autocrypt: addr=linux@roeck-us.net; keydata=
 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
 mDW4+i+XlNFUPUYMrIKi9joBhu18ssf5i5Q=
In-Reply-To: <20240716030725.400400-1-nichen@iscas.ac.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 7/15/24 20:07, Chen Ni wrote:
> Replace a comma between expression statements by a semicolon.
> 
> Fixes: 1f6602c8ed1e ("watchdog: lenovo_se10_wdt: Watchdog driver for Lenovo SE10 platform")
> Signed-off-by: Chen Ni <nichen@iscas.ac.cn>

Reviewed-by: Guenter Roeck <linux@roeck-us.net>



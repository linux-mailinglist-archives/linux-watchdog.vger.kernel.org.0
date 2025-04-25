Return-Path: <linux-watchdog+bounces-3386-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sy.mirrors.kernel.org (sy.mirrors.kernel.org [IPv6:2604:1380:40f1:3f00::1])
	by mail.lfdr.de (Postfix) with ESMTPS id E831EA9BFA6
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 09:20:46 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sy.mirrors.kernel.org (Postfix) with ESMTPS id DDB387ACF9F
	for <lists+linux-watchdog@lfdr.de>; Fri, 25 Apr 2025 07:19:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D80D42A83;
	Fri, 25 Apr 2025 07:20:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b="MpP9ri1+"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from mout.web.de (mout.web.de [212.227.15.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5D01E86E;
	Fri, 25 Apr 2025 07:20:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=212.227.15.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745565640; cv=none; b=mQlnjbrD5rBdOWy1ydVFk5t/5H+v1Tc2leXxXPWbG8jcOlCxoSx4WXw9MtOIcvX27ZazrOYxT8QEFwiWmKF0+Jz7TmmtyxlW3rU8LQUdr7+To5mOl7gDdJqtxLGvM7NCZPsRB/uNpJ+SCh/dX6lX4Bo4dQUB8Dk4T2+JMWNvt9g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745565640; c=relaxed/simple;
	bh=bVBhZ79t9Nyj1UZ8zf01rJtr9F6u/OzJrutdIMRLZeI=;
	h=Message-ID:Date:MIME-Version:To:Cc:References:Subject:From:
	 In-Reply-To:Content-Type; b=lNIKOT+ugyErLJxjoXc9J2kWwar8PusCiU5bcuoheVKiJi/Wr5OMnQfvHRnN4aHmlHpCHaIapYPnvqu21JtA/1MHZPIZlxiB8jNrvBpudsurQlYu/hv1ax+dXfk5mgIeeNneldEHZue7MO2WyLz6rAYN6SEs42jfwSYv8gwuDfA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de; spf=pass smtp.mailfrom=web.de; dkim=pass (2048-bit key) header.d=web.de header.i=markus.elfring@web.de header.b=MpP9ri1+; arc=none smtp.client-ip=212.227.15.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=web.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=web.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=web.de;
	s=s29768273; t=1745565616; x=1746170416; i=markus.elfring@web.de;
	bh=bVBhZ79t9Nyj1UZ8zf01rJtr9F6u/OzJrutdIMRLZeI=;
	h=X-UI-Sender-Class:Message-ID:Date:MIME-Version:To:Cc:References:
	 Subject:From:In-Reply-To:Content-Type:Content-Transfer-Encoding:
	 cc:content-transfer-encoding:content-type:date:from:message-id:
	 mime-version:reply-to:subject:to;
	b=MpP9ri1+dO0zF/+FBIGbqMDyNFwR0EYoYHrXfs39reEzrgJ92Fymb46+sVffF8Q8
	 3PQpvcKPRvU5ga0g/0ZTI5Po/NVFVBdBy1GDWqidGxx424qiK0kszC7iYHWEJfvgx
	 tIpjK8Onmd54afRuSUmOJrwAjnu59lU4wJleJExk9jZF1ko0NTCWShgvH4sakeHth
	 blDyNKV1gVLQn59WfwWVv28QL7BVh6RBFm2xeGmruhwronS07bK/z/jHdupcRHS5i
	 CNi9rbwXoaDhASi9Qvbgv+c4hDFHLP+7ekoyPgWksud8SRUa7OLfeDrQW+X0XAOEh
	 /QDVgsz1jBFmkUleAg==
X-UI-Sender-Class: 814a7b36-bfc1-4dae-8640-3722d8ec6cd6
Received: from [192.168.178.29] ([94.31.70.30]) by smtp.web.de (mrweb005
 [213.165.67.108]) with ESMTPSA (Nemesis) id 1N0Zns-1v4h9w2gkO-011Eel; Fri, 25
 Apr 2025 09:20:16 +0200
Message-ID: <423ef656-b9df-4bfc-8988-dc73e23b5399@web.de>
Date: Fri, 25 Apr 2025 09:20:08 +0200
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Henry Martin <bsdhenrymartin@gmail.com>, linux-watchdog@vger.kernel.org,
 =?UTF-8?B?R8O8bnRlciBSw7Zjaw==?= <linux@roeck-us.net>,
 Wim Van Sebroeck <wim@linux-watchdog.org>
Cc: LKML <linux-kernel@vger.kernel.org>
References: <20250424071648.89016-1-bsdhenrymartin@gmail.com>
Subject: Re: [PATCH v1] watchdog: lenovo_se30_wdt: Fix null-ptr-deref in
 lenovo_se30_wdt_probe()
Content-Language: en-GB
From: Markus Elfring <Markus.Elfring@web.de>
In-Reply-To: <20250424071648.89016-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Provags-ID: V03:K1:J2xxrlyp7SgIOB1I0NFTAK6Z+49yB+g+GuHPLWnyUYERaSxla09
 XiqNlDzc43CmiIlfex7WX0ePbZYJSN/VZXkMLld3csTS/bjBbOcM8BPEWQM/iYRAq4/72wp
 QoSCkyGOXA/FyBDN0SyVlF5XYmVKStn+pSBP82BzvjWtzfDeL18QSRsAVRL3oc5boJ0ZAOc
 +xm7Arn2U3jbe7L485mdw==
X-Spam-Flag: NO
UI-OutboundReport: notjunk:1;M01:P0:4Byl2kiND/A=;OsQOy3r4VK5XIbCr/wYdObnTHN9
 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

=E2=80=A6
> Add NULL check after devm_ioremap() to prevent this issue.

Would you get into the mood to replace the text =E2=80=9Cnull-ptr-deref=E2=
=80=9D
in the summary phrase?

Regards,
Markus


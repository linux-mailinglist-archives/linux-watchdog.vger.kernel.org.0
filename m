Return-Path: <linux-watchdog+bounces-2820-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 5D450A245C3
	for <lists+linux-watchdog@lfdr.de>; Sat,  1 Feb 2025 01:02:32 +0100 (CET)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 32F8C3A7BAD
	for <lists+linux-watchdog@lfdr.de>; Sat,  1 Feb 2025 00:02:24 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7A06129B0;
	Sat,  1 Feb 2025 00:02:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b="MhebLXyG";
	dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b="gOPnjtEb"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from fhigh-b3-smtp.messagingengine.com (fhigh-b3-smtp.messagingengine.com [202.12.124.154])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 24B091C01;
	Sat,  1 Feb 2025 00:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=202.12.124.154
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738368147; cv=none; b=gx5JcDssTxow5+E9BiggGcCAsRmVfulkL8iKsfADGJtK5rLLM49X379CleSq2x2LEEtQkoiCuhquX6OU3R35WgUdKIhhVH7bvmJzF9NX8z4VrRF+KnJtsiinPZLqgqtFWmIz5EcfYIM2LymX7bC7BmIf5JwgGlAAMo7A0R3AwcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738368147; c=relaxed/simple;
	bh=GeHRQZwWKDIDgPJbc5wVL+4rQVqxddhYyDa9I1STNvw=;
	h=MIME-Version:Date:From:To:Cc:Message-Id:In-Reply-To:References:
	 Subject:Content-Type; b=UkT+bWZCPxHkF+Fwoo2LjiKV3Wjr4xP2DxmLScZFRSWNUqSHLblKLhl+Z4ljKXd1+pg3p7ODnqa58ZpO+pDBCrLj6Xh29gunBuAbF38iAdjRPdUwazPNDi7Wjg5DVUDD7Ol2zNDx8rIVjxbvYFLEgGdpriswGuLD2Z0COsU+UWo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca; spf=pass smtp.mailfrom=squebb.ca; dkim=pass (2048-bit key) header.d=squebb.ca header.i=@squebb.ca header.b=MhebLXyG; dkim=pass (2048-bit key) header.d=messagingengine.com header.i=@messagingengine.com header.b=gOPnjtEb; arc=none smtp.client-ip=202.12.124.154
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=squebb.ca
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=squebb.ca
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfhigh.stl.internal (Postfix) with ESMTP id CF10F2540182;
	Fri, 31 Jan 2025 19:02:23 -0500 (EST)
Received: from phl-imap-10 ([10.202.2.85])
  by phl-compute-02.internal (MEProxy); Fri, 31 Jan 2025 19:02:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=squebb.ca; h=cc
	:cc:content-transfer-encoding:content-type:content-type:date
	:date:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to; s=fm1; t=1738368143;
	 x=1738454543; bh=nhyb02ZzxeXtzB5J3+zdvvmG5OCBXjU58jDpxej9KJ4=; b=
	MhebLXyG9M4GvncBjdSGFx/gDPzOiZEsrPvn//3s4SQmVzNDa35igdNrlCf6v1nT
	meB33fvuZ9qSd3wGRrCPX2AgIHKZOt3ya0cCCAHkoVx39nPXqSEz4+bdWLKx2M9S
	YZXStDWUpYzQCy1cYIi67bgDZmtT2WU8RMgdLHZiAkPQLYgDCIvBsFy7JJwnxF/0
	U5WbWbo735tJb0AnX7h9u+z4WCScPz/hTatCfPniKiwFVphZNRgnwYmX4Ei2kV9U
	lvmmlkh/se1mntOV1MKJcWGdPFwBbueSp+cJmQ3SvnVnzG0oj6F+2g/+hU1xaQtk
	rzBL6ooVPEn/yw6Mv4Wuhg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-transfer-encoding
	:content-type:content-type:date:date:feedback-id:feedback-id
	:from:from:in-reply-to:in-reply-to:message-id:mime-version
	:references:reply-to:subject:subject:to:to:x-me-proxy
	:x-me-sender:x-me-sender:x-sasl-enc; s=fm3; t=1738368143; x=
	1738454543; bh=nhyb02ZzxeXtzB5J3+zdvvmG5OCBXjU58jDpxej9KJ4=; b=g
	OPnjtEbROX8gIm9mVbCsvP07FGidp6So22wpJFYlCtV4FBlWgw5Iu8V7pUq+nD/3
	CWrwSZa4VsSsNGzS2yufXRblAAz8hYXIFfZLZy5Kje6bnWY2chpXRxMlokMcFyEF
	YA5arJW12rOx3LVsFxDRlWWrdE7pkbwIljc6rhg8hfpq5g6aiNoDDQVlnnmm2t8N
	73CDqWsm7t8xr92Y4DhdCpmwVpoqc0xDo47Zu9rySlSjg5Qq3sAO4w2d4QIvz6ds
	WdK7xl4FN8PmeLZetlJ0jSsi3ZAQ1vvXMtl4+PSFyg6QuzBwYdhNTtKt4nT22OtI
	hAxW6tAVzhzQHmadkajdg==
X-ME-Sender: <xms:j2SdZ7bJuwTYJ6CcDSjHfZihq-PbJ1dg_yoaJS9x8O1b692XJxQrRw>
    <xme:j2SdZ6aC7Mq2v6XaSROh1n0Hr933NaiRkbsl-oFpP772SMJvkhBhhHHP0rBgdhRl-
    VyQKgoP7yl4Q_cQnvI>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddutddujecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpggftfghnshhusghstghrihgsvgdp
    uffrtefokffrpgfnqfghnecuuegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivg
    hnthhsucdlqddutddtmdenucfjughrpefoggffhffvvefkjghfufgtgfesthejredtredt
    tdenucfhrhhomhepfdforghrkhcurfgvrghrshhonhdfuceomhhpvggrrhhsohhnqdhlvg
    hnohhvohesshhquhgvsggsrdgtrgeqnecuggftrfgrthhtvghrnhephfeuvdehteeghedt
    hedtveehuddvjeejgffgieejvdegkefhfeelheekhedvffehnecuvehluhhsthgvrhfuih
    iivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepmhhpvggrrhhsohhnqdhlvghnohhv
    ohesshhquhgvsggsrdgtrgdpnhgspghrtghpthhtohephedpmhhouggvpehsmhhtphhouh
    htpdhrtghpthhtohepughosggvrheslhgvnhhovhhordgtohhmpdhrtghpthhtohepfihi
    mheslhhinhhugidqfigrthgthhguohhgrdhorhhgpdhrtghpthhtoheplhhinhhugiesrh
    hovggtkhdquhhsrdhnvghtpdhrtghpthhtoheplhhinhhugidqkhgvrhhnvghlsehvghgv
    rhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtoheplhhinhhugidqfigrthgthhguohhgse
    hvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:j2SdZ98cfUA-pWWqZcZfy4hd-ssgFFUvI7vV_yWQ62v_AImIuv8egg>
    <xmx:j2SdZxoRrSEjpYoBef65_kdRamxLud_cV4IcEC1WveSPMXJY17jPdg>
    <xmx:j2SdZ2poSWAqaxXA4Pdg8nU-fOxsuW-LzzBX6679_5InVJXesH6V6Q>
    <xmx:j2SdZ3RNr6FNGd7ODntLJG8_JpObsQOThsJoIUnBVDKR4kIukyjofA>
    <xmx:j2SdZ_klMvAAAeH78O1gGUUuVOSALMnhtcPrV9MW3dl5mT1euQDCpXwG>
Feedback-ID: ibe194615:Fastmail
Received: by mailuser.phl.internal (Postfix, from userid 501)
	id 323AE3C0069; Fri, 31 Jan 2025 19:02:23 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Date: Fri, 31 Jan 2025 19:02:02 -0500
From: "Mark Pearson" <mpearson-lenovo@squebb.ca>
To: "Guenter Roeck" <linux@roeck-us.net>
Cc: "David Ober" <dober@lenovo.com>,
 "Wim Van Sebroeck" <wim@linux-watchdog.org>, linux-watchdog@vger.kernel.org,
 linux-kernel@vger.kernel.org
Message-Id: <73d5ae60-779e-4cf6-a81f-9da9fb9e7952@app.fastmail.com>
In-Reply-To: <28754bd6-aa1e-4f48-8f48-e7d54a9d282b@roeck-us.net>
References: <mpearson-lenovo@squebb.ca>
 <20250131204855.1827-1-mpearson-lenovo@squebb.ca>
 <28754bd6-aa1e-4f48-8f48-e7d54a9d282b@roeck-us.net>
Subject: Re: [PATCH v3] watchdog: lenovo_se30_wdt: Watchdog driver for Lenovo SE30
 platform
Content-Type: text/plain
Content-Transfer-Encoding: 7bit

On Fri, Jan 31, 2025, at 5:26 PM, Guenter Roeck wrote:
> On 1/31/25 12:48, Mark Pearson wrote:
>> Watchdog driver implementation for Lenovo SE30 platform.
>> 
>> Signed-off-by: Mark Pearson <mpearson-lenovo@squebb.ca>
>> ---
>
> Reviewed-by: Guenter Roeck <linux@roeck-us.net>

Thanks for the review and the guidance.
Mark


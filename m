Return-Path: <linux-watchdog+bounces-4957-lists+linux-watchdog=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id uEVCJFaQm2nM2AMAu9opvQ
	(envelope-from <linux-watchdog+bounces-4957-lists+linux-watchdog=lfdr.de@vger.kernel.org>)
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 00:25:10 +0100
X-Original-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 34EEE170BF6
	for <lists+linux-watchdog@lfdr.de>; Mon, 23 Feb 2026 00:25:09 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id 8FEF63016C9A
	for <lists+linux-watchdog@lfdr.de>; Sun, 22 Feb 2026 23:25:01 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 2FD4635CBAC;
	Sun, 22 Feb 2026 23:24:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JCSZhzfV";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ap7TTK6A"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC60E35CB96
	for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 23:24:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771802699; cv=none; b=OOxQZB8o65qa7YU5e/i551mhamTI6xNq7pH2PeTQoPXzl7zlCCQrEYQaetJxjl2FAJE+X92r0ojDloAQkY3qkCFNYFgTRB6OkBgtbkEC4C31YOfl/XN8JbeaRlNn1UDJceA8zKeY6gBv0SKArIuOAFeFNm3JUEgM3aH1CZH+e/M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771802699; c=relaxed/simple;
	bh=SkO/B/gXCX86rT6IHsqP2ZKD1GOqYCsQ8Sl/kYokldE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Li6d1AX8DggVPXXOSYMIIffhv+NM5tKCrgAq8RfN1TbbM/f8Law3zIJQuUvmswlxJV66QvwKWp5KBzNU/s+pb/CYs+/wdH/ZrwYBCZPp9HwVZfto2NACWrM3LdJZd5I3YLmzlP9earZmlthnlLkRD960x4l2oR10kl4JzsDIBh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JCSZhzfV; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ap7TTK6A; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771802697;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=1TXPc+xv+DiJDTOFDVqNC6iY0NtuGgv2xQ6k3P4loHo=;
	b=JCSZhzfVN1hSwpKI6VduBgYVvR6g7tqljQNYY7gtC5V82U2S3DObInYDplgeIFkQf6AJPg
	MfVxEwd8vA5tRGeDSzZXXmCm4nCjH6Gcs/kt0T0KUr7QdW0UB7FMSnRmjR6yDQcobUwd/d
	28JC6jZcSVKtnxa4kiq9afBRfgpXl8M=
Received: from mail-qk1-f200.google.com (mail-qk1-f200.google.com
 [209.85.222.200]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-711-miAZ5B6TO4-NPk0QWcZhiw-1; Sun, 22 Feb 2026 18:24:55 -0500
X-MC-Unique: miAZ5B6TO4-NPk0QWcZhiw-1
X-Mimecast-MFC-AGG-ID: miAZ5B6TO4-NPk0QWcZhiw_1771802695
Received: by mail-qk1-f200.google.com with SMTP id af79cd13be357-8cb4e37a796so3196873185a.2
        for <linux-watchdog@vger.kernel.org>; Sun, 22 Feb 2026 15:24:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771802695; x=1772407495; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1TXPc+xv+DiJDTOFDVqNC6iY0NtuGgv2xQ6k3P4loHo=;
        b=Ap7TTK6AZmB5YS8V2ucO3BiHEJiUaej5IjmWho78QhTjVFRLXfH44LRdcS9EEzMZ4G
         nIuUby1OdspJS0waLdhDrq4K37vPKEqzJrhwmN0lkCZsNLrCaeMvbqnkguX+XJOEODDv
         hlpxaYElu/wiiLzXf6Vh1tPBpMCM7v+DKNsjXGsjJ1UbJrL5FLhddI/BtHer1uNJl+ye
         jAqAy3cUf3T/Yr34LwXOQaTAF3tvuyTf25Kf/OKgVik3y0x4MUHGGSJAli0/sobx574w
         ilbjX527NuR3ool1BPLNe/IpmSVOXSXvKsofV9kX8glMdHZ2+tRnI0DF8Me5tlJDPTas
         p+4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771802695; x=1772407495;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1TXPc+xv+DiJDTOFDVqNC6iY0NtuGgv2xQ6k3P4loHo=;
        b=Q3WPX/p9cLMedJ/YaZM3iMBzcoRLPR9Qas+W5B5eDeHokM6Z/914a1pKoReqeTIMYH
         OuF+FyAIWbDuld4/IQDTyojCD7Tu2atVBw6X8bOXBlIzmIx0DUdWPgjVCFIkFR3bdQK1
         BF68rPUcWmMfzsWrBLgrHkopFrxQ3ND6oJr6sF+Jikz3Em8KPZjqvJgK4cuuUwmqf3KR
         I8PFmDB3PrIUK7iDZg3ygguq1l196Rg2wnM+aVvppA95zqxr7jafm+O2Wg6wBiMgyncZ
         sJrqApVmhFE0ASyeReEuf3TUrJwbZDMdiHsqXXFBiPB6VYy68nj+WxZuyi7ZORuT6QOy
         S/FA==
X-Gm-Message-State: AOJu0Yzz/j9hThWds0v1XnBlNtII7hzoAtjq6tmsyE1uiepzR+Dvr6yK
	Li79GVpd3/mL4GBa0wiGA63CVJE7QLr2eDiKsc42d9mGIxQu2prXLGhXPVn1AI5eX6C0FdOP+4T
	+JN9Kc5/dtOIkAin0MQ8IRmM34vo5YrhnMQlhFCr3Gsk2JVu64uMs1eZJd6JBPQLUw1oAHOB23l
	cQFOZz7HoF7dqX8LNT7Kej6qAU4s932MxyyMYT7so5+oPnt27+ChI=
X-Gm-Gg: AZuq6aIj7mDbHORGszhGqudxhOTPH6ldEhQ7zvBXEpL7IxYn+FIhqNwmhXRemZCWoHP
	1v1Pi521aec+9Yr7hmdfj62WSYIiWznCimTvdjD75v4Ijlx70sf/LxInfjUeBGiA2DfbzxFvqad
	VkGyQwcIV1oDm5kq8zkUCuz3FYm/0R5frhJsPDGC5A6fcdKlh8S9IXnwTw6byPjt8uhLIj0Neno
	FpkZdQ91NLb//JpiFVJKYIo7NH0eozjhI6Qsaud1Fgo4w7zTqzJaQKfVYtX1dmQ926XImQ+jLTo
	VGGUPsYeldlPGmrqq+EUBPozt9+sTy6ISK/Jc8ncg+2DgNqlEnLUoKTHUHFKOjEOh1HTlMM0MYk
	dEa/FZfGgjOHlXNO5Cw2iAQ6bTcuNUVJcwEg5QBRSHaZ0FfQVPMNgzXMTxWF8iA==
X-Received: by 2002:a05:620a:4692:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cb8c9e6578mr836597785a.7.1771802694952;
        Sun, 22 Feb 2026 15:24:54 -0800 (PST)
X-Received: by 2002:a05:620a:4692:b0:8cb:1c3a:90d6 with SMTP id af79cd13be357-8cb8c9e6578mr836595485a.7.1771802694490;
        Sun, 22 Feb 2026 15:24:54 -0800 (PST)
Received: from [192.168.1.15] (c-73-183-52-120.hsd1.pa.comcast.net. [73.183.52.120])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8997e242fadsm53860936d6.34.2026.02.22.15.24.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 15:24:54 -0800 (PST)
From: Brian Masney <bmasney@redhat.com>
Date: Sun, 22 Feb 2026 18:24:16 -0500
Subject: [PATCH 1/2] watchdog: pic32-wdt: allow driver to be compiled on
 all architectures with COMPILE_TEST
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260222-watchdog-pic32-v1-1-a2538aa528d1@redhat.com>
References: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
In-Reply-To: <20260222-watchdog-pic32-v1-0-a2538aa528d1@redhat.com>
To: Wim Van Sebroeck <wim@linux-watchdog.org>, 
 Guenter Roeck <linux@roeck-us.net>
Cc: linux-watchdog@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Brian Masney <bmasney@redhat.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1119; i=bmasney@redhat.com;
 s=20250903; h=from:subject:message-id;
 bh=SkO/B/gXCX86rT6IHsqP2ZKD1GOqYCsQ8Sl/kYokldE=;
 b=owGbwMvMwCW2/dJd9di6A+2Mp9WSGDJnT3AQDZ+q+CAvVEj1Yop57q4/r5smtTyd2D537f6KO
 xPOcL8+1lHKwiDGxSArpsiyJNeoICJ1le29O5osMHNYmUCGMHBxCsBEfvszMhztzaq5wLJovpzV
 p63/FydnKofFPJga6TRx3sfLvv/3iW5nZLjVH+fhXcaQ55qmMcHxhP/30qykZaEPtmi9r+Nze72
 Zhx0A
X-Developer-Key: i=bmasney@redhat.com; a=openpgp;
 fpr=A46D32705865AA3DDEDC2904B7D2DD275D7EC087
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-2.16 / 15.00];
	ARC_ALLOW(-1.00)[subspace.kernel.org:s=arc-20240116:i=1];
	DMARC_POLICY_ALLOW(-0.50)[redhat.com,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:172.234.253.10:c];
	R_DKIM_ALLOW(-0.20)[redhat.com:s=mimecast20190719,redhat.com:s=google];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[bounces-4957-lists,linux-watchdog=lfdr.de];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[redhat.com:+];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	RCVD_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[bmasney@redhat.com,linux-watchdog@vger.kernel.org];
	ASN(0.00)[asn:63949, ipnet:172.234.224.0/19, country:SG];
	NEURAL_HAM(-0.00)[-0.999];
	TAGGED_RCPT(0.00)[linux-watchdog];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[sea.lore.kernel.org:helo,sea.lore.kernel.org:rdns]
X-Rspamd-Queue-Id: 34EEE170BF6
X-Rspamd-Action: no action

This driver currently only supports builds against a PIC32 target, or
with COMPILE_TEST on MIPS. Now that commit 5aa5879eeebb ("watchdog:
pic32-wdt: update include to use pic32.h from platform_data") is merged,
it's possible to compile this driver on other architectures.

To avoid future breakage of this driver in the future, let's update the
Kconfig so that it can be built with COMPILE_TEST enabled on all
architectures.

Signed-off-by: Brian Masney <bmasney@redhat.com>
---
 drivers/watchdog/Kconfig | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/watchdog/Kconfig b/drivers/watchdog/Kconfig
index dc78729ba2a5d6e035ed3cbe5c2b631d11b76b20..ec20bb80bdd5eb9b4852ffc8150e7999a42f7635 100644
--- a/drivers/watchdog/Kconfig
+++ b/drivers/watchdog/Kconfig
@@ -2011,7 +2011,7 @@ config MT7621_WDT
 config PIC32_WDT
 	tristate "Microchip PIC32 hardware watchdog"
 	select WATCHDOG_CORE
-	depends on MACH_PIC32 || (MIPS && COMPILE_TEST)
+	depends on MACH_PIC32 || COMPILE_TEST
 	help
 	  Watchdog driver for the built in watchdog hardware in a PIC32.
 

-- 
2.53.0



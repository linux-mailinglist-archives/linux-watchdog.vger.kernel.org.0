Return-Path: <linux-watchdog+bounces-4654-lists+linux-watchdog=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-watchdog@lfdr.de
Delivered-To: lists+linux-watchdog@lfdr.de
Received: from sea.lore.kernel.org (sea.lore.kernel.org [172.234.253.10])
	by mail.lfdr.de (Postfix) with ESMTPS id 529A0CB1D14
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Dec 2025 04:49:38 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by sea.lore.kernel.org (Postfix) with ESMTP id B0E1C305C4DB
	for <lists+linux-watchdog@lfdr.de>; Wed, 10 Dec 2025 03:49:23 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 7CACA23B63E;
	Wed, 10 Dec 2025 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="D1qsaeZo"
X-Original-To: linux-watchdog@vger.kernel.org
Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4B46772618;
	Wed, 10 Dec 2025 03:49:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765338563; cv=none; b=F/prHDOdUu40u826ZHWIUXSJlaJyj3XWq4/rtNHU5ROrZ8C2X1CiwjKuon33wrxBwsNM/RcuJgIeTMBHDR4OVYRCSdO3ubuIkDOnN+jpdIXyVWVo/WnSezr5HhDiXR5HNEafuJJj2voJa6VCQtflUjD5PoKfHqFTbWiD16BhDrM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765338563; c=relaxed/simple;
	bh=2duEGX3dZSI2y/mcqGLpjVGeIwAQ6krssuhwn+x9ar8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=llZn5WJUPzvDfORN67Nwgx+oQSQXSk7lZ+KiECtYJikgYyHu+CABgZi5MxtFQjIBmck3cYUN72Jbag+K4Yt+np8WOxoSMaJZfIFRolirYzMCEBq0y7r/ni8icRiQV0lRcrCjyTzKiG+lDBu44w9cDSlR1/jc4WSoy7N+nkVVAGQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=D1qsaeZo; arc=none smtp.client-ip=10.30.226.201
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B4BD0C19422;
	Wed, 10 Dec 2025 03:49:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765338562;
	bh=2duEGX3dZSI2y/mcqGLpjVGeIwAQ6krssuhwn+x9ar8=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=D1qsaeZoK0RF2+TU8Mrd4EbqQ03vQ+rtJWHEJIhsaevZgJ/Vu8rXy9040C4klPJsv
	 hlb7c0X+rvYWNTPWSvzrLYx6fW0sTzg10uhJhrcq3t34ChGOiCHiyIBhxtY6mpD7De
	 pAyEJOb8LPC2TTd4jaO6cOTqN5dgkn22d49xAxscjGen4dryivEJ9IcNi0lKKJNuDO
	 NZWLx1gE8wcgyrPgHS1hu8NIgjzIj8c04MVNwiQ6G43DqgVWRtxGJ0CiU6ZE0DB7P5
	 5qxwl4enZpJelundQdA1VkWp/+Oh6laRUSpTyhootO2oe+ENwSU8IOcjod0C7dYTKM
	 rSCOW3cqfhUmg==
From: Sasha Levin <sashal@kernel.org>
To: patches@lists.linux.dev,
	stable@vger.kernel.org
Cc: Li Qiang <liqiang01@kylinos.cn>,
	Guenter Roeck <linux@roeck-us.net>,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Sasha Levin <sashal@kernel.org>,
	linux-watchdog@vger.kernel.org
Subject: [PATCH AUTOSEL 6.18-5.10] via_wdt: fix critical boot hang due to unnamed resource allocation
Date: Tue,  9 Dec 2025 22:48:44 -0500
Message-ID: <20251210034915.2268617-3-sashal@kernel.org>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20251210034915.2268617-1-sashal@kernel.org>
References: <20251210034915.2268617-1-sashal@kernel.org>
Precedence: bulk
X-Mailing-List: linux-watchdog@vger.kernel.org
List-Id: <linux-watchdog.vger.kernel.org>
List-Subscribe: <mailto:linux-watchdog+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-watchdog+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-stable: review
X-Patchwork-Hint: Ignore
X-stable-base: Linux 6.18
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Li Qiang <liqiang01@kylinos.cn>

[ Upstream commit 7aa31ee9ec92915926e74731378c009c9cc04928 ]

The VIA watchdog driver uses allocate_resource() to reserve a MMIO
region for the watchdog control register. However, the allocated
resource was not given a name, which causes the kernel resource tree
to contain an entry marked as "<BAD>" under /proc/iomem on x86
platforms.

During boot, this unnamed resource can lead to a critical hang because
subsequent resource lookups and conflict checks fail to handle the
invalid entry properly.

Signed-off-by: Li Qiang <liqiang01@kylinos.cn>
Reviewed-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Guenter Roeck <linux@roeck-us.net>
Signed-off-by: Wim Van Sebroeck <wim@linux-watchdog.org>
Signed-off-by: Sasha Levin <sashal@kernel.org>
---

LLM Generated explanations, may be completely bogus:

## Analysis Summary

### 1. COMMIT MESSAGE ANALYSIS

**Subject:** "via_wdt: fix critical boot hang due to unnamed resource
allocation"
- Uses "fix" language indicating a bug fix
- Claims "critical boot hang" - a severe user-impacting issue
- Affects VIA chipset watchdog driver

**Tags analysis:**
- **Missing:** No "Cc: stable@vger.kernel.org" tag
- **Missing:** No "Fixes:" tag
- **Present:** Reviewed-by: Guenter Roeck (well-respected watchdog/hwmon
  maintainer)
- **Present:** Signed-off by both watchdog maintainers (Guenter Roeck
  and Wim Van Sebroeck)

### 2. CODE CHANGE ANALYSIS

The fix is a **single line addition**:
```c
wdt_res.name = "via_wdt";
```

**The bug mechanism:**
1. `wdt_res` is declared as a static `struct resource` without
   initialization at line 67
2. `allocate_resource()` is called without the resource having a name
   set
3. This results in a NULL `name` field, shown as `<BAD>` in
   `/proc/iomem`
4. The kernel's resource code in `kernel/resource.c:141` shows: `r->name
   ? r->name : "<BAD>"`

**Why this is needed:**
- Other watchdog drivers (e.g., `f71808e_wdt.c`) properly set
  `wdt_res.name = "superio port"`
- `struct resource` has a `name` field that should always be populated

### 3. CLASSIFICATION

- **Type:** Bug fix (not new feature)
- **Severity:** The commit claims "critical boot hang" - though the
  exact mechanism isn't fully clear from code inspection, unnamed
  resources can cause problems in resource lookup/conflict resolution
  paths
- **Scope:** Single driver, single line

### 4. SCOPE AND RISK ASSESSMENT

| Factor | Assessment |
|--------|------------|
| Lines changed | 1 |
| Files touched | 1 |
| Complexity | Extremely low |
| Risk of regression | **Zero** - adding a name to a resource cannot
cause problems |
| Self-contained | Yes, no dependencies |

### 5. USER IMPACT

- **Affected users:** VIA chipset hardware with watchdog (relatively
  rare, older hardware)
- **Severity if bug hits:** Boot hang (critical)
- **Bug age:** Present since driver was introduced in 2011
  (`dc3c56b703dad`)

### 6. STABILITY INDICATORS

- **Reviewed-by:** Guenter Roeck - respected maintainer
- **Correctness:** Obviously correct - other drivers do the same thing
- **Testing:** Implied through maintainer review

### 7. DEPENDENCY CHECK

- **No dependencies** - completely self-contained
- **Driver exists in all stable trees** - since 2011

## Risk vs Benefit Analysis

**Benefits:**
- Fixes potential boot hang for affected users
- Fixes incorrect `/proc/iomem` display (`<BAD>` entries)
- Brings via_wdt in line with other watchdog drivers

**Risks:**
- **None** - setting a resource name is a standard, safe operation

## Concerns

1. **No explicit stable request:** The maintainers didn't add `Cc:
   stable@vger.kernel.org`
2. **Boot hang claim verification:** The exact mechanism for the boot
   hang isn't easily traced in code, though I trust the
   reporter/maintainers' assessment
3. **Limited scope:** Only affects VIA chipset users (small population)

## Conclusion

This commit **should be backported** to stable kernels. Despite the
missing stable tag, it meets all stable criteria:

1. ✅ **Obviously correct** - trivial one-line fix matching other
   drivers' patterns
2. ✅ **Fixes a real bug** - unnamed resources are incorrect and can
   cause issues
3. ✅ **Small and contained** - one line in one file
4. ✅ **No new features** - just fixing existing code
5. ✅ **Zero regression risk** - adding a name cannot break anything
6. ✅ **Maintainer reviewed** - Guenter Roeck reviewed

The fix is so trivially safe that even if the boot hang is rare, there
is no downside to including it in stable.

**YES**

 drivers/watchdog/via_wdt.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/watchdog/via_wdt.c b/drivers/watchdog/via_wdt.c
index d647923d68fed..f555763926518 100644
--- a/drivers/watchdog/via_wdt.c
+++ b/drivers/watchdog/via_wdt.c
@@ -165,6 +165,7 @@ static int wdt_probe(struct pci_dev *pdev,
 		dev_err(&pdev->dev, "cannot enable PCI device\n");
 		return -ENODEV;
 	}
+	wdt_res.name = "via_wdt";
 
 	/*
 	 * Allocate a MMIO region which contains watchdog control register
-- 
2.51.0


